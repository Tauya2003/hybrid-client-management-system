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

    final deviceId = await _storage.getOrCreateDeviceId();
    final records = pending.map((item) {
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
      for (final item in pending) {
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
        final item = pending.firstWhere(
          (i) => i.entityId == localId,
          orElse: () => pending.first,
        );
        await _db.syncQueueDao.markError(item.id, err['error'] as String? ?? 'Unknown error');
      }

      final firstError = errors.isNotEmpty
          ? (errors.first['error'] as String? ?? 'Unknown server error')
          : null;

      return SyncResult(
        pushed: processed.length,
        conflicts: conflicts.length,
        errors: errors.length,
        message: firstError,
      );
    } on DioException catch (e) {
      // Network error — leave items as pending for next sync
      return SyncResult(pushed: 0, conflicts: 0, errors: 1, message: e.message);
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
      id: Value(d['id'] as String),
      name: Value(d['name'] as String),
      description: Value(d['description'] as String? ?? ''),
      minAmount: Value(double.parse(d['min_amount'].toString())),
      maxAmount: Value(double.parse(d['max_amount'].toString())),
      interestRate: Value(double.parse(d['interest_rate'].toString())),
      interestType: Value(d['interest_type'] as String),
      repaymentFrequency: Value(d['repayment_frequency'] as String),
      minTerm: Value(d['min_term'] as int),
      maxTerm: Value(d['max_term'] as int),
      processingFeeRate: Value(double.tryParse(d['processing_fee_rate']?.toString() ?? '') ?? 0.0),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncedAt: Value(DateTime.now().toUtc().toIso8601String()),
    );
  }

  ClientsTableCompanion _clientCompanionFromJson(Map<String, dynamic> d) {
    return ClientsTableCompanion(
      id: Value(d['id'] as String),
      nationalId: Value(d['national_id'] as String),
      phoneNumber: Value(d['phone_number'] as String),
      firstName: Value(d['first_name'] as String),
      lastName: Value(d['last_name'] as String),
      dateOfBirth: Value(d['date_of_birth'] as String),
      gender: Value(d['gender'] as String),
      address: Value(d['address'] as String),
      nextOfKinName: Value(d['next_of_kin_name'] as String? ?? ''),
      nextOfKinPhone: Value(d['next_of_kin_phone'] as String? ?? ''),
      branchId: Value((d['branch'] ?? d['branch_id']) as String),
      createdById: Value((d['created_by'] ?? d['created_by_id']) as String),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  GroupsTableCompanion _groupCompanionFromJson(Map<String, dynamic> d) {
    return GroupsTableCompanion(
      id: Value(d['id'] as String),
      name: Value(d['name'] as String),
      groupType: Value(d['group_type'] as String),
      branchId: Value((d['branch'] ?? d['branch_id']) as String),
      loanOfficerId: Value((d['loan_officer'] ?? d['loan_officer_id']) as String),
      meetingDay: Value(d['meeting_day'] as String? ?? ''),
      meetingFrequency: Value(d['meeting_frequency'] as String? ?? ''),
      meetingLocation: Value(d['meeting_location'] as String? ?? ''),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  GroupMembershipsTableCompanion _membershipCompanionFromJson(Map<String, dynamic> d) {
    return GroupMembershipsTableCompanion(
      id: Value(d['id'] as String),
      groupId: Value((d['group'] ?? d['group_id']) as String),
      clientId: Value((d['client'] ?? d['client_id']) as String),
      role: Value(d['role'] as String? ?? 'member'),
      joinedAt: Value(d['joined_at'] as String),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  LoanApplicationsTableCompanion _applicationCompanionFromJson(Map<String, dynamic> d) {
    return LoanApplicationsTableCompanion(
      id: Value(d['id'] as String),
      clientId: Value((d['client'] ?? d['client_id']) as String),
      groupId: Value((d['group'] ?? d['group_id']) as String?),
      loanProductId: Value((d['loan_product'] ?? d['loan_product_id']) as String),
      loanProductName: Value(d['product_name'] as String? ?? ''),
      amountRequested: Value(double.parse(d['amount_requested'].toString())),
      term: Value(d['term'] as int),
      purpose: Value(d['purpose'] as String),
      status: Value(d['status'] as String),
      appliedById: Value((d['applied_by'] ?? d['applied_by_id']) as String),
      appliedAt: Value(d['applied_at'] as String),
      notes: Value(d['notes'] as String? ?? ''),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  RepaymentsTableCompanion _repaymentCompanionFromJson(Map<String, dynamic> d) {
    return RepaymentsTableCompanion(
      id: Value(d['id'] as String),
      loanId: Value((d['loan'] ?? d['loan_id']) as String),
      amount: Value(double.parse(d['amount'].toString())),
      paymentDate: Value(d['payment_date'] as String),
      paymentMethod: Value(d['payment_method'] as String? ?? 'cash'),
      referenceNumber: Value(d['reference_number'] as String? ?? ''),
      receivedById: Value((d['received_by'] ?? d['received_by_id']) as String),
      notes: Value(d['notes'] as String? ?? ''),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  SavingsAccountsTableCompanion _savingsAccountCompanionFromJson(Map<String, dynamic> d) {
    return SavingsAccountsTableCompanion(
      id: Value(d['id'] as String),
      clientId: Value((d['client'] ?? d['client_id']) as String),
      accountNumber: Value(d['account_number'] as String),
      accountType: Value(d['account_type'] as String? ?? 'voluntary'),
      balance: Value(double.parse(d['balance'].toString())),
      minimumBalance: Value(double.tryParse(d['minimum_balance']?.toString() ?? '') ?? 0),
      isActive: Value(d['is_active'] as bool? ?? true),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
  }

  SavingsTransactionsTableCompanion _savingsTxnCompanionFromJson(Map<String, dynamic> d) {
    return SavingsTransactionsTableCompanion(
      id: Value(d['id'] as String),
      savingsAccountId: Value((d['savings_account'] ?? d['savings_account_id']) as String),
      transactionType: Value(d['transaction_type'] as String),
      amount: Value(double.parse(d['amount'].toString())),
      balanceAfter: Value(double.parse(d['balance_after'].toString())),
      transactionDate: Value(d['transaction_date'] as String),
      performedById: Value((d['performed_by'] ?? d['performed_by_id']) as String),
      referenceNumber: Value(d['reference_number'] as String? ?? ''),
      notes: Value(d['notes'] as String? ?? ''),
      syncStatus: const Value('synced'),
      createdAt: Value(d['created_at'] as String),
      updatedAt: Value(d['updated_at'] as String),
      version: Value(d['version'] as int? ?? 1),
      isDeleted: Value(d['is_deleted'] as bool? ?? false),
    );
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
