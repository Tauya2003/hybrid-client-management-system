import 'package:drift/drift.dart';
import '../database/app_database.dart';
import '../database/tables/clients_table.dart';

part 'clients_dao.g.dart';

@DriftAccessor(tables: [ClientsTable, GroupsTable, GroupMembershipsTable])
class ClientsDao extends DatabaseAccessor<AppDatabase> with _$ClientsDaoMixin {
  ClientsDao(super.db);

  Stream<List<ClientsTableData>> watchActiveClients({String? branchId}) {
    final query = select(clientsTable)
      ..where((t) => t.isDeleted.equals(false) & t.isActive.equals(true));
    if (branchId != null) {
      query.where((t) => t.branchId.equals(branchId));
    }
    query.orderBy([(t) => OrderingTerm(expression: t.lastName)]);
    return query.watch();
  }

  Future<ClientsTableData?> getClientById(String id) {
    return (select(clientsTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<ClientsTableData?> findByNationalId(String nationalId) {
    return (select(clientsTable)
          ..where((t) => t.nationalId.equals(nationalId)))
        .getSingleOrNull();
  }

  Future<ClientsTableData?> findByPhone(String phone) {
    return (select(clientsTable)
          ..where((t) => t.phoneNumber.equals(phone)))
        .getSingleOrNull();
  }

  Future<void> upsertClient(ClientsTableCompanion client) {
    return into(clientsTable).insertOnConflictUpdate(client);
  }

  Future<void> upsertClients(List<ClientsTableCompanion> clients) {
    return batch((b) {
      b.insertAll(clientsTable, clients, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<ClientsTableData>> getPendingClients() {
    return (select(clientsTable)
          ..where((t) => t.syncStatus.equals('pending')))
        .get();
  }

  Future<void> markSynced(String id, String syncStatus) {
    return (update(clientsTable)..where((t) => t.id.equals(id)))
        .write(ClientsTableCompanion(syncStatus: Value(syncStatus)));
  }

  Future<List<GroupsTableData>> getGroupsForBranch(String branchId) {
    return (select(groupsTable)
          ..where((t) => t.branchId.equals(branchId) & t.isDeleted.equals(false)))
        .get();
  }

  Future<void> upsertGroup(GroupsTableCompanion group) {
    return into(groupsTable).insertOnConflictUpdate(group);
  }

  Future<List<GroupMembershipsTableData>> getMembershipsForGroup(String groupId) {
    return (select(groupMembershipsTable)
          ..where((t) => t.groupId.equals(groupId) & t.isDeleted.equals(false)))
        .get();
  }

  Future<void> upsertGroupMembership(GroupMembershipsTableCompanion m) {
    return into(groupMembershipsTable).insertOnConflictUpdate(m);
  }
}
