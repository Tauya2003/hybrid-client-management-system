import 'package:drift/drift.dart';

class SavingsAccountsTable extends Table {
  @override
  String get tableName => 'savings_accounts';

  TextColumn get id => text()();
  TextColumn get clientId => text().named('client_id')();
  TextColumn get accountNumber => text().named('account_number')();
  TextColumn get accountType => text().named('account_type').withDefault(const Constant('voluntary'))();
  RealColumn get balance => real().withDefault(const Constant(0.0))();
  RealColumn get minimumBalance => real().named('minimum_balance').withDefault(const Constant(0.0))();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('synced'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class SavingsTransactionsTable extends Table {
  @override
  String get tableName => 'savings_transactions';

  TextColumn get id => text()();
  TextColumn get savingsAccountId => text().named('savings_account_id')();
  TextColumn get transactionType => text().named('transaction_type')();
  RealColumn get amount => real()();
  RealColumn get balanceAfter => real().named('balance_after')();
  TextColumn get transactionDate => text().named('transaction_date')();
  TextColumn get performedById => text().named('performed_by_id')();
  TextColumn get referenceNumber => text().named('reference_number').withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
