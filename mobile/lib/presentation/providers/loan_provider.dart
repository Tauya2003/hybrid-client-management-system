import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/local/database/app_database.dart';
import 'auth_provider.dart';
import 'database_provider.dart';

const _uuid = Uuid();

final loanProductsProvider = StreamProvider<List<LoanProductsTableData>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.loansDao.watchActiveLoanProducts();
});

final loanApplicationsProvider = StreamProvider.family<List<LoanApplicationsTableData>, String?>(
  (ref, clientId) {
    final db = ref.watch(databaseProvider);
    return db.loansDao.watchApplications(clientId: clientId);
  },
);

final loansProvider = StreamProvider.family<List<LoansTableData>, String?>(
  (ref, clientId) {
    final db = ref.watch(databaseProvider);
    return db.loansDao.watchLoans(clientId: clientId);
  },
);

final loanDetailProvider = FutureProvider.family<LoansTableData?, String>(
  (ref, id) async {
    final db = ref.watch(databaseProvider);
    return db.loansDao.getLoanById(id);
  },
);

final scheduleProvider = FutureProvider.family<List<RepaymentScheduleTableData>, String>(
  (ref, loanId) {
    final db = ref.watch(databaseProvider);
    return db.loansDao.getScheduleForLoan(loanId);
  },
);

final repaymentActionsProvider = Provider<RepaymentActions>((ref) {
  final db = ref.watch(databaseProvider);
  final user = ref.watch(authProvider).user;
  return RepaymentActions(db, user?.id ?? '');
});

class RepaymentActions {
  final AppDatabase _db;
  final String _userId;

  RepaymentActions(this._db, this._userId);

  Future<String> recordRepayment({
    required String loanId,
    required double amount,
    required String paymentDate,
    required String paymentMethod,
    String referenceNumber = '',
    String notes = '',
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();

    await _db.loansDao.upsertRepayment(RepaymentsTableCompanion(
      id: Value(id),
      loanId: Value(loanId),
      amount: Value(amount),
      paymentDate: Value(paymentDate),
      paymentMethod: Value(paymentMethod),
      referenceNumber: Value(referenceNumber),
      receivedById: Value(_userId),
      notes: Value(notes),
      syncStatus: const Value('pending'),
      createdAt: Value(now),
      updatedAt: Value(now),
    ));

    final payload = {
      'id': id,
      'loan_id': loanId,
      'amount': amount,
      'payment_date': paymentDate,
      'payment_method': paymentMethod,
      'reference_number': referenceNumber,
      'received_by_id': _userId,
      'notes': notes,
      'updated_at': now,
      'version': 1,
      'is_deleted': false,
    };

    await _db.syncQueueDao.enqueue(SyncQueueTableCompanion(
      entityType: const Value('repayment'),
      entityId: Value(id),
      operation: const Value('create'),
      payload: Value(jsonEncode(payload)),
      createdAt: Value(now),
    ));

    return id;
  }
}

final loanApplicationActionsProvider = Provider<LoanApplicationActions>((ref) {
  final db = ref.watch(databaseProvider);
  final user = ref.watch(authProvider).user;
  return LoanApplicationActions(db, user?.id ?? '');
});

class LoanApplicationActions {
  final AppDatabase _db;
  final String _userId;

  LoanApplicationActions(this._db, this._userId);

  Future<String> createApplication({
    required String clientId,
    required String loanProductId,
    required String loanProductName,
    required double amountRequested,
    required int term,
    required String purpose,
    String? groupId,
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();

    await _db.loansDao.upsertApplication(LoanApplicationsTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      groupId: Value(groupId),
      loanProductId: Value(loanProductId),
      loanProductName: Value(loanProductName),
      amountRequested: Value(amountRequested),
      term: Value(term),
      purpose: Value(purpose),
      status: const Value('draft'),
      appliedById: Value(_userId),
      appliedAt: Value(now),
      syncStatus: const Value('pending'),
      createdAt: Value(now),
      updatedAt: Value(now),
    ));

    final payload = {
      'id': id,
      'client_id': clientId,
      'group_id': groupId,
      'loan_product_id': loanProductId,
      'amount_requested': amountRequested,
      'term': term,
      'purpose': purpose,
      'status': 'draft',
      'applied_by_id': _userId,
      'applied_at': now,
      'updated_at': now,
      'version': 1,
      'is_deleted': false,
    };

    await _db.syncQueueDao.enqueue(SyncQueueTableCompanion(
      entityType: const Value('loan_application'),
      entityId: Value(id),
      operation: const Value('create'),
      payload: Value(jsonEncode(payload)),
      createdAt: Value(now),
    ));

    return id;
  }
}
