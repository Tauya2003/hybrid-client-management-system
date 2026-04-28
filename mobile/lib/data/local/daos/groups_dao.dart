import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/clients_table.dart';

part 'groups_dao.g.dart';

@DriftAccessor(tables: [GroupsTable, GroupMembershipsTable, ClientsTable])
class GroupsDao extends DatabaseAccessor<AppDatabase> with _$GroupsDaoMixin {
  GroupsDao(super.db);

  Stream<List<GroupsTableData>> watchGroups({String? branchId}) {
    final query = select(groupsTable)
      ..where((t) => t.isDeleted.equals(false) & t.isActive.equals(true));
    if (branchId != null) {
      query.where((t) => t.branchId.equals(branchId));
    }
    query.orderBy([(t) => OrderingTerm(expression: t.name)]);
    return query.watch();
  }

  Future<GroupsTableData?> getGroupById(String id) {
    return (select(groupsTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> upsertGroup(GroupsTableCompanion group) {
    return into(groupsTable).insertOnConflictUpdate(group);
  }

  Future<List<GroupMembershipsTableData>> getMembersOfGroup(String groupId) {
    return (select(groupMembershipsTable)
          ..where((t) => t.groupId.equals(groupId) & t.isDeleted.equals(false)))
        .get();
  }

  Future<void> upsertMembership(GroupMembershipsTableCompanion m) {
    return into(groupMembershipsTable).insertOnConflictUpdate(m);
  }

  Future<List<GroupsTableData>> getPendingGroups() {
    return (select(groupsTable)..where((t) => t.syncStatus.equals('pending'))).get();
  }
}
