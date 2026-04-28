// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_dao.dart';

// ignore_for_file: type=lint
mixin _$SavingsDaoMixin on DatabaseAccessor<AppDatabase> {
  $SavingsAccountsTableTable get savingsAccountsTable =>
      attachedDatabase.savingsAccountsTable;
  $SavingsTransactionsTableTable get savingsTransactionsTable =>
      attachedDatabase.savingsTransactionsTable;
  SavingsDaoManager get managers => SavingsDaoManager(this);
}

class SavingsDaoManager {
  final _$SavingsDaoMixin _db;
  SavingsDaoManager(this._db);
  $$SavingsAccountsTableTableTableManager get savingsAccountsTable =>
      $$SavingsAccountsTableTableTableManager(
          _db.attachedDatabase, _db.savingsAccountsTable);
  $$SavingsTransactionsTableTableTableManager get savingsTransactionsTable =>
      $$SavingsTransactionsTableTableTableManager(
          _db.attachedDatabase, _db.savingsTransactionsTable);
}
