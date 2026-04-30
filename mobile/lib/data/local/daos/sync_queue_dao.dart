import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/sync_queue_table.dart';

part 'sync_queue_dao.g.dart';

@DriftAccessor(tables: [SyncQueueTable, CachedUsersTable])
class SyncQueueDao extends DatabaseAccessor<AppDatabase> with _$SyncQueueDaoMixin {
  SyncQueueDao(super.db);

  Future<List<SyncQueueTableData>> getPendingItems() {
    return (select(syncQueueTable)
          ..where((t) => t.status.equals('pending'))
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt)]))
        .get();
  }

  Future<int> enqueue(SyncQueueTableCompanion item) {
    return into(syncQueueTable).insert(item);
  }

  Future<bool> hasActiveItemForEntity(String entityType, String entityId) async {
    final item = await (select(syncQueueTable)
          ..where((t) =>
              t.entityType.equals(entityType) &
              t.entityId.equals(entityId) &
              (t.status.equals('pending') | t.status.equals('error'))))
        .getSingleOrNull();
    return item != null;
  }

  Future<void> markDone(int id) {
    return (update(syncQueueTable)..where((t) => t.id.equals(id)))
        .write(const SyncQueueTableCompanion(status: Value('done')));
  }

  Future<void> markError(int id, String error) async {
    final item = await (select(syncQueueTable)..where((t) => t.id.equals(id))).getSingleOrNull();
    final newCount = (item?.retryCount ?? 0) + 1;
    await (update(syncQueueTable)..where((t) => t.id.equals(id))).write(
      SyncQueueTableCompanion(
        status: const Value('error'),
        lastError: Value(error),
        retryCount: Value(newCount),
      ),
    );
  }

  Future<void> resetForRetry() {
    return (update(syncQueueTable)
          ..where((t) => t.status.equals('error')))
        .write(const SyncQueueTableCompanion(status: Value('pending')));
  }

  Future<void> clearCompleted() {
    return (delete(syncQueueTable)..where((t) => t.status.equals('done'))).go();
  }

  Future<int> pendingCount() async {
    final items = await getPendingItems();
    return items.length;
  }

  // Cached user
  Future<CachedUsersTableData?> getCachedUser(String id) {
    return (select(cachedUsersTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> upsertCachedUser(CachedUsersTableCompanion user) {
    return into(cachedUsersTable).insertOnConflictUpdate(user);
  }
}
