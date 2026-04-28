import 'package:drift/drift.dart';

class SyncQueueTable extends Table {
  @override
  String get tableName => 'sync_queue';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text().named('entity_type')();
  TextColumn get entityId => text().named('entity_id')();
  TextColumn get operation => text()(); // create, update, delete
  TextColumn get payload => text()(); // JSON string
  TextColumn get status => text().withDefault(const Constant('pending'))(); // pending, processing, done, error
  IntColumn get retryCount => integer().named('retry_count').withDefault(const Constant(0))();
  TextColumn get lastError => text().named('last_error').nullable()();
  TextColumn get createdAt => text().named('created_at')();
}

class CachedUsersTable extends Table {
  @override
  String get tableName => 'cached_users';

  TextColumn get id => text()();
  TextColumn get username => text()();
  TextColumn get email => text().withDefault(const Constant(''))();
  TextColumn get firstName => text().named('first_name').withDefault(const Constant(''))();
  TextColumn get lastName => text().named('last_name').withDefault(const Constant(''))();
  TextColumn get role => text()();
  TextColumn get branchId => text().named('branch_id').nullable()();
  TextColumn get branchName => text().named('branch_name').nullable()();
  TextColumn get phoneNumber => text().named('phone_number').withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}
