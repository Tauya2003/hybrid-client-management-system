import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/savings_table.dart';

part 'savings_dao.g.dart';

@DriftAccessor(tables: [SavingsAccountsTable, SavingsTransactionsTable])
class SavingsDao extends DatabaseAccessor<AppDatabase> with _$SavingsDaoMixin {
  SavingsDao(super.db);

  Stream<List<SavingsAccountsTableData>> watchAccountsForClient(String clientId) {
    return (select(savingsAccountsTable)
          ..where((t) => t.clientId.equals(clientId) & t.isDeleted.equals(false)))
        .watch();
  }

  Future<SavingsAccountsTableData?> getAccountById(String id) {
    return (select(savingsAccountsTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<void> upsertAccount(SavingsAccountsTableCompanion account) {
    return into(savingsAccountsTable).insertOnConflictUpdate(account);
  }

  Stream<List<SavingsTransactionsTableData>> watchTransactions(String accountId) {
    return (select(savingsTransactionsTable)
          ..where((t) => t.savingsAccountId.equals(accountId) & t.isDeleted.equals(false))
          ..orderBy([(t) => OrderingTerm(expression: t.transactionDate, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<void> upsertTransaction(SavingsTransactionsTableCompanion txn) {
    return into(savingsTransactionsTable).insertOnConflictUpdate(txn);
  }

  Future<List<SavingsTransactionsTableData>> getPendingTransactions() {
    return (select(savingsTransactionsTable)
          ..where((t) => t.syncStatus.equals('pending') & t.isDeleted.equals(false)))
        .get();
  }
}
