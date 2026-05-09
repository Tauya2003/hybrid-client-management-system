import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/api_constants.dart';
import '../core/network/connectivity_service.dart';
import '../core/storage/secure_storage.dart';
import '../data/local/database/app_database.dart';
import '../presentation/providers/database_provider.dart';

final syncEngineProvider = Provider<SyncEngine>((ref) {
  final db = ref.watch(databaseProvider);
  final connectivity = ref.watch(connectivityServiceProvider);
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(secureStorageProvider);
  final engine = SyncEngine(db, connectivity, dio, storage, ref);
  ref.onDispose(engine.dispose);
  return engine;
});

final syncStatusProvider = StateProvider<SyncStatus>((ref) => SyncStatus.idle);
final pendingSyncCountProvider = StateProvider<int>((ref) => 0);

enum SyncStatus { idle, syncing, success, error }

class SyncEngine {
  final AppDatabase _db;
  final ConnectivityService _connectivity;
  final Dio _dio;
  final SecureStorage _storage;
  final Ref _ref;

  StreamSubscription<bool>? _connectivitySub;
  bool _isSyncing = false;

  static const _lastSyncKey = 'last_sync_timestamp';

  SyncEngine(this._db, this._connectivity, this._dio, this._storage, this._ref) {
    _connectivitySub = _connectivity.onlineStream.listen((isOnline) {
      if (isOnline) triggerSync();
    });
  }

  Future<SyncResult> triggerSync() async {
    if (_isSyncing) return const SyncResult(pushed: 0, conflicts: 0, errors: 0);

    _isSyncing = true;
    _ref.read(syncStatusProvider.notifier).state = SyncStatus.syncing;
    try {
      // Reset previously errored items so they get another push attempt
      await _db.syncQueueDao.resetForRetry();
      await _pullLoanProducts();
      final result = await _push();
      await _pull();
      await _db.syncQueueDao.clearCompleted();
      _ref.read(syncStatusProvider.notifier).state = SyncStatus.success;
      return result;
    } catch (e) {
      _ref.read(syncStatusProvider.notifier).state = SyncStatus.error;
      return SyncResult(pushed: 0, conflicts: 0, errors: 1, message: e.toString());
    } finally {
      _isSyncing = false;
    }
  }

  Future<void> _pullLoanProducts() async {
    try {
      final response = await _dio.get(ApiConstants.loanProducts);
      final data = response.data;
      final List<dynamic> results = data is Map ? (data['results'] ?? []) : data;
      for (final item in results) {
        final d = item as Map<String, dynamic>;
        await _db.loansDao.upsertLoanProduct(_loanProductCompanionFromJson(d));
      }
    } on DioException {
      // Non-critical — app works with whatever products are already local
    }
  }

  Future<SyncResult> _push() async {
    final pending = await _db.syncQueueDao.getPendingItems();
    if (pending.isEmpty) return const SyncResult(pushed: 0, conflicts: 0, errors: 0);

    final filtered = await _filterInvalidPendingItems(pending);
    final sortablePending = filtered.validItems;
    if (sortablePending.isEmpty) {
      return SyncResult(
        pushed: 0,
        conflicts: 0,
        errors: filtered.preflightErrors,
        message: filtered.firstErrorMessage,
      );
    }

    final sortedPending = [...sortablePending]..sort((a, b) {
      final byType = _entityPushPriority(a.entityType).compareTo(_entityPushPriority(b.entityType));
      if (byType != 0) return byType;
      final byTime = a.createdAt.compareTo(b.createdAt);
      if (byTime != 0) return byTime;
      return a.id.compareTo(b.id);
    });

    final deviceId = await _storage.getOrCreateDeviceId();
    final records = sortedPending.map((item) {
      return {
        'entity_type': item.entityType,
        'local_id': item.entityId,
        'operation': item.operation,
        'payload': jsonDecode(item.payload),
        'client_updated_at': item.createdAt,
      };
    }).toList();

    try {
      final response = await _dio.post(
        ApiConstants.syncPush,
        data: {'device_id': deviceId, 'records': records},
      );

      final data = response.data as Map<String, dynamic>;
      final processed = data['processed'] as List? ?? [];
      final conflicts = data['conflicts'] as List? ?? [];
      final errors = data['errors'] as List? ?? [];

      // Mark successfully processed items as done
      for (final item in sortedPending) {
        final result = [...processed, ...conflicts].firstWhere(
          (r) => r['local_id'] == item.entityId,
          orElse: () => null,
        );
        if (result != null) {
          await _db.syncQueueDao.markDone(item.id);
        }
      }

      // Handle errors — mark for retry
      for (final err in errors) {
        final localId = err['local_id'] as String?;
        if (localId == null) continue;
        final item = sortedPending.firstWhere(
          (i) => i.entityId == localId,
          orElse: () => sortedPending.first,
        );
        await _db.syncQueueDao.markError(item.id, err['error'] as String? ?? 'Unknown error');
      }

      final firstError = errors.isNotEmpty
          ? (errors.first['error'] as String? ?? 'Unknown server error')
          : filtered.firstErrorMessage;

      return SyncResult(
        pushed: processed.length,
        conflicts: conflicts.length,
        errors: errors.length + filtered.preflightErrors,
        message: firstError,
      );
    } on DioException catch (e) {
      // Network error — leave items as pending for next sync
      return SyncResult(pushed: 0, conflicts: 0, errors: 1, message: e.message);
    }
  }

  Future<_PendingFilterResult> _filterInvalidPendingItems(
    List<SyncQueueTableData> pending,
  ) async {
    final validItems = <SyncQueueTableData>[];
    int preflightErrors = 0;
    String? firstErrorMessage;

    for (final item in pending) {
      if (item.entityType == 'loan_application' && item.operation == 'create') {
        final payload = jsonDecode(item.payload) as Map<String, dynamic>;
        final clientId = payload['client_id']?.toString();
        if (clientId == null || clientId.isEmpty) {
          const message = 'Loan application has no client_id. Please recreate it.';
          await _db.syncQueueDao.markError(item.id, message);
          firstErrorMessage ??= message;
          preflightErrors++;
          continue;
        }

        final client = await _db.clientsDao.getClientById(clientId);
        final hasClientInQueue = await _db.syncQueueDao.hasActiveItemForEntity(
          'client',
          clientId,
        );

        if (client == null && !hasClientInQueue) {
          const message =
              'Skipped loan application because its client is missing locally. '
              'Recreate the client and application.';
          await _db.syncQueueDao.markError(item.id, message);
          firstErrorMessage ??= message;
          preflightErrors++;
          continue;
        }
      }

      validItems.add(item);
    }

    return _PendingFilterResult(
      validItems: validItems,
      preflightErrors: preflightErrors,
      firstErrorMessage: firstErrorMessage,
    );
  }

  int _entityPushPriority(String entityType) {
    switch (entityType) {
      case 'client':
        return 0;
      case 'group':
        return 1;
      case 'group_membership':
        return 2;
      case 'loan_application':
        return 3;
      case 'repayment':
        return 4;
      case 'savings_account':
        return 5;
      case 'savings_transaction':
        return 6;
      default:
        return 100;
    }
  }

  Future<void> _pull() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSync = prefs.getString(_lastSyncKey) ??
        DateTime.utc(2000).toIso8601String();
    final deviceId = await _storage.getOrCreateDeviceId();

    try {
      final response = await _dio.get(
        ApiConstants.syncPull,
        queryParameters: {'since': lastSync, 'device_id': deviceId},
      );

      final data = response.data as Map<String, dynamic>;
      final records = data['records'] as List? ?? [];
      final syncTimestamp = data['sync_timestamp'] as String?;

      for (final record in records) {
        await _applyPulledRecord(record as Map<String, dynamic>);
      }

      if (syncTimestamp != null) {
        await prefs.setString(_lastSyncKey, syncTimestamp);
      }
    } on DioException {
      // Pull failure is non-critical — we still have local data
    }
  }

  Future<void> _applyPulledRecord(Map<String, dynamic> record) async {
    final entityType = record['entity_type'] as String;
    final operation = record['operation'] as String;
    final data = record['data'] as Map<String, dynamic>;

    if (operation == 'delete') {
      await _softDeleteLocal(entityType, data['id'] as String);
      return;
    }

    switch (entityType) {
      case 'loan_product':
        await _db.loansDao.upsertLoanProduct(_loanProductCompanionFromJson(data));
      case 'client':
        await _db.clientsDao.upsertClient(_clientCompanionFromJson(data));
      case 'group':
        await _db.clientsDao.upsertGroup(_groupCompanionFromJson(data));
      case 'group_membership':
        await _db.clientsDao.upsertGroupMembership(_membershipCompanionFromJson(data));
      case 'loan_application':
        await _db.loansDao.upsertApplication(_applicationCompanionFromJson(data));
      case 'repayment':
        await _db.loansDao.upsertRepayment(_repaymentCompanionFromJson(data));
      case 'savings_account':
        await _db.savingsDao.upsertAccount(_savingsAccountCompanionFromJson(data));
      case 'savings_transaction':
        await _db.savingsDao.upsertTransaction(_savingsTxnCompanionFromJson(data));
    }
  }

  Future<void> _softDeleteLocal(String entityType, String id) async {
    // Mark as deleted in the relevant table — simplified approach
    // A full implementation would update the specific table
  }

  // ── Companion builders ──────────────────────────────────────────────────────

  LoanProductsTableCompanion _loanProductCompanionFromJson(Map<String, dynamic> d) {
    return LoanProductsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      name: Value(_stringValue(d, 'name')),
      description: Value(_stringValue(d, 'description', defaultValue: '')),
      minAmount: Value(double.parse(d['min_amount'].toString())),
      maxAmount: Value(double.parse(d['max_amount'].toString())),
      interestRate: Value(double.parse(d['interest_rate'].toString())),
      interestType: Value(_stringValue(d, 'interest_type')),
      repaymentFrequency: Value(_stringValue(d, 'repayment_frequency')),
      minTerm: Value(d['min_term'] as int),
      maxTerm: Value(d['max_term'] as int),
      processingFeeRate: Value(double.tryParse(d['processing_fee_rate']?.toString() ?? '') ?? 0.0),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncedAt: Value(DateTime.now().toUtc().toIso8601String()),
    );
  }

  ClientsTableCompanion _clientCompanionFromJson(Map<String, dynamic> d) {
    return ClientsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      nationalId: Value(_stringValue(d, 'national_id')),
      phoneNumber: Value(_stringValue(d, 'phone_number')),
      firstName: Value(_stringValue(d, 'first_name')),
      lastName: Value(_stringValue(d, 'last_name')),
      dateOfBirth: Value(_stringValue(d, 'date_of_birth')),
      gender: Value(_stringValue(d, 'gender')),
      address: Value(_stringValue(d, 'address')),
      nextOfKinName: Value(_stringValue(d, 'next_of_kin_name', defaultValue: '')),
      nextOfKinPhone: Value(_stringValue(d, 'next_of_kin_phone', defaultValue: '')),
      branchId: Value(_firstStringValue(d, ['branch', 'branch_id'])),
      createdById: Value(_firstStringValue(d, ['created_by', 'created_by_id'])),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  GroupsTableCompanion _groupCompanionFromJson(Map<String, dynamic> d) {
    return GroupsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      name: Value(_stringValue(d, 'name')),
      groupType: Value(_stringValue(d, 'group_type')),
      branchId: Value(_firstStringValue(d, ['branch', 'branch_id'])),
      loanOfficerId: Value(_firstStringValue(d, ['loan_officer', 'loan_officer_id'])),
      meetingDay: Value(_stringValue(d, 'meeting_day', defaultValue: '')),
      meetingFrequency: Value(_stringValue(d, 'meeting_frequency', defaultValue: '')),
      meetingLocation: Value(_stringValue(d, 'meeting_location', defaultValue: '')),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  GroupMembershipsTableCompanion _membershipCompanionFromJson(Map<String, dynamic> d) {
    return GroupMembershipsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      groupId: Value(_firstStringValue(d, ['group', 'group_id'])),
      clientId: Value(_firstStringValue(d, ['client', 'client_id'])),
      role: Value(_stringValue(d, 'role', defaultValue: 'member')),
      joinedAt: Value(_stringValue(d, 'joined_at')),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  LoanApplicationsTableCompanion _applicationCompanionFromJson(Map<String, dynamic> d) {
    return LoanApplicationsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      clientId: Value(_firstStringValue(d, ['client', 'client_id'])),
      groupId: Value(_nullableFirstStringValue(d, ['group', 'group_id'])),
      loanProductId: Value(_firstStringValue(d, ['loan_product', 'loan_product_id'])),
      loanProductName: Value(_stringValue(d, 'product_name', defaultValue: '')),
      amountRequested: Value(double.parse(d['amount_requested'].toString())),
      term: Value(d['term'] as int),
      purpose: Value(_stringValue(d, 'purpose')),
      status: Value(_stringValue(d, 'status', defaultValue: 'draft')),
      appliedById: Value(_firstStringValue(d, ['applied_by', 'applied_by_id'])),
      appliedAt: Value(_stringValue(d, 'applied_at')),
      notes: Value(_stringValue(d, 'notes', defaultValue: '')),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  RepaymentsTableCompanion _repaymentCompanionFromJson(Map<String, dynamic> d) {
    return RepaymentsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      loanId: Value(_firstStringValue(d, ['loan', 'loan_id'])),
      amount: Value(double.parse(d['amount'].toString())),
      paymentDate: Value(_stringValue(d, 'payment_date')),
      paymentMethod: Value(_stringValue(d, 'payment_method', defaultValue: 'cash')),
      referenceNumber: Value(_stringValue(d, 'reference_number', defaultValue: '')),
      receivedById: Value(_firstStringValue(d, ['received_by', 'received_by_id'])),
      notes: Value(_stringValue(d, 'notes', defaultValue: '')),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  SavingsAccountsTableCompanion _savingsAccountCompanionFromJson(Map<String, dynamic> d) {
    return SavingsAccountsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      clientId: Value(_firstStringValue(d, ['client', 'client_id'])),
      accountNumber: Value(_stringValue(d, 'account_number')),
      accountType: Value(_stringValue(d, 'account_type', defaultValue: 'voluntary')),
      balance: Value(double.parse(d['balance'].toString())),
      minimumBalance: Value(double.tryParse(d['minimum_balance']?.toString() ?? '') ?? 0),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  SavingsTransactionsTableCompanion _savingsTxnCompanionFromJson(Map<String, dynamic> d) {
    return SavingsTransactionsTableCompanion(
      id: Value(_stringValue(d, 'id')),
      savingsAccountId: Value(_firstStringValue(d, ['savings_account', 'savings_account_id'])),
      transactionType: Value(_stringValue(d, 'transaction_type')),
      amount: Value(double.parse(d['amount'].toString())),
      balanceAfter: Value(double.parse(d['balance_after'].toString())),
      transactionDate: Value(_stringValue(d, 'transaction_date')),
      performedById: Value(_firstStringValue(d, ['performed_by', 'performed_by_id'])),
      referenceNumber: Value(_stringValue(d, 'reference_number', defaultValue: '')),
      notes: Value(_stringValue(d, 'notes', defaultValue: '')),
      syncStatus: const Value('synced'),
      createdAt: Value(_stringValue(d, 'created_at')),
      updatedAt: Value(_stringValue(d, 'updated_at')),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  String _stringValue(
    Map<String, dynamic> d,
    String key, {
    String defaultValue = '',
  }) {
    final value = d[key];
    if (value == null) return defaultValue;
    return value.toString();
  }

  String _firstStringValue(Map<String, dynamic> d, List<String> keys) {
    for (final key in keys) {
      final value = d[key];
      if (value != null) return value.toString();
    }
    return '';
  }

  String? _nullableFirstStringValue(Map<String, dynamic> d, List<String> keys) {
    for (final key in keys) {
      final value = d[key];
      if (value != null) return value.toString();
    }
    return null;
  }

  void dispose() {
    _connectivitySub?.cancel();
  }
}

class SyncResult {
  final int pushed;
  final int conflicts;
  final int errors;
  final String? message;

  const SyncResult({
    required this.pushed,
    required this.conflicts,
    required this.errors,
    this.message,
  });
}

class _PendingFilterResult {
  final List<SyncQueueTableData> validItems;
  final int preflightErrors;
  final String? firstErrorMessage;

  const _PendingFilterResult({
    required this.validItems,
    required this.preflightErrors,
    required this.firstErrorMessage,
  });
}
