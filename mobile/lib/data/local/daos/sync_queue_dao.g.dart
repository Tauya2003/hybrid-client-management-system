// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_queue_dao.dart';

// ignore_for_file: type=lint
mixin _$SyncQueueDaoMixin on DatabaseAccessor<AppDatabase> {
  $SyncQueueTableTable get syncQueueTable => attachedDatabase.syncQueueTable;
  $CachedUsersTableTable get cachedUsersTable =>
      attachedDatabase.cachedUsersTable;
  SyncQueueDaoManager get managers => SyncQueueDaoManager(this);
}

class SyncQueueDaoManager {
  final _$SyncQueueDaoMixin _db;
  SyncQueueDaoManager(this._db);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(
          _db.attachedDatabase, _db.syncQueueTable);
  $$CachedUsersTableTableTableManager get cachedUsersTable =>
      $$CachedUsersTableTableTableManager(
          _db.attachedDatabase, _db.cachedUsersTable);
}
