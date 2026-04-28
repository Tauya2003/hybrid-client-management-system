import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'tables/clients_table.dart';
import 'tables/loans_table.dart';
import 'tables/savings_table.dart';
import 'tables/sync_queue_table.dart';
import '../daos/clients_dao.dart';
import '../daos/groups_dao.dart';
import '../daos/loans_dao.dart';
import '../daos/savings_dao.dart';
import '../daos/sync_queue_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ClientsTable,
    GroupsTable,
    GroupMembershipsTable,
    LoanProductsTable,
    LoanApplicationsTable,
    LoansTable,
    RepaymentScheduleTable,
    RepaymentsTable,
    SavingsAccountsTable,
    SavingsTransactionsTable,
    SyncQueueTable,
    CachedUsersTable,
  ],
  daos: [
    ClientsDao,
    GroupsDao,
    LoansDao,
    SavingsDao,
    SyncQueueDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(String encryptionKey)
      : super(_openConnection(encryptionKey));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // Future migrations go here
        },
      );
}

LazyDatabase _openConnection(String encryptionKey) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mfi_encrypted.db'));

    // Library override is applied in main() before this runs.
    // Using NativeDatabase (not createInBackground) so it shares the isolate
    // where the open.overrideFor was set.
    return NativeDatabase(
      file,
      setup: (rawDb) {
        rawDb.execute("PRAGMA key='$encryptionKey'");
        rawDb.execute('PRAGMA cipher_page_size = 4096');
        rawDb.execute('PRAGMA kdf_iter = 64000');
      },
    );
  });
}
