import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/local/database/app_database.dart';
import 'auth_provider.dart';
import 'database_provider.dart';

const _uuid = Uuid();

final savingsAccountsProvider = StreamProvider.family<List<SavingsAccountsTableData>, String>(
  (ref, clientId) {
    final db = ref.watch(databaseProvider);
    return db.savingsDao.watchAccountsForClient(clientId);
  },
);

final savingsTransactionsProvider = StreamProvider.family<List<SavingsTransactionsTableData>, String>(
  (ref, accountId) {
    final db = ref.watch(databaseProvider);
    return db.savingsDao.watchTransactions(accountId);
  },
);

final savingsActionsProvider = Provider<SavingsActions>((ref) {
  final db = ref.watch(databaseProvider);
  final user = ref.watch(authProvider).user;
  return SavingsActions(db, user?.id ?? '');
});

class SavingsActions {
  final AppDatabase _db;
  final String _userId;

  SavingsActions(this._db, this._userId);

  Future<void> recordTransaction({
    required String accountId,
    required String transactionType,
    required double amount,
    required double currentBalance,
    required String transactionDate,
    String referenceNumber = '',
    String notes = '',
  }) async {
    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();
    final balanceAfter = transactionType == 'deposit'
        ? currentBalance + amount
        : currentBalance - amount;

    await _db.savingsDao.upsertTransaction(SavingsTransactionsTableCompanion(
      id: Value(id),
      savingsAccountId: Value(accountId),
      transactionType: Value(transactionType),
      amount: Value(amount),
      balanceAfter: Value(balanceAfter),
      transactionDate: Value(transactionDate),
      performedById: Value(_userId),
      referenceNumber: Value(referenceNumber),
      notes: Value(notes),
      syncStatus: const Value('pending'),
      createdAt: Value(now),
      updatedAt: Value(now),
    ));

    // Update local balance optimistically
    final account = await _db.savingsDao.getAccountById(accountId);
    if (account != null) {
      await _db.savingsDao.upsertAccount(account.toCompanion(true).copyWith(
            balance: Value(balanceAfter),
            updatedAt: Value(now),
            version: Value(account.version + 1),
          ));
    }

    final payload = {
      'id': id,
      'savings_account_id': accountId,
      'transaction_type': transactionType,
      'amount': amount,
      'balance_after': balanceAfter,
      'transaction_date': transactionDate,
      'performed_by_id': _userId,
      'reference_number': referenceNumber,
      'notes': notes,
      'updated_at': now,
      'version': 1,
      'is_deleted': false,
    };

    await _db.syncQueueDao.enqueue(SyncQueueTableCompanion(
      entityType: const Value('savings_transaction'),
      entityId: Value(id),
      operation: const Value('create'),
      payload: Value(jsonEncode(payload)),
      createdAt: Value(now),
    ));
  }
}
