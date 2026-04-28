import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

import 'core/storage/secure_storage.dart';
import 'data/local/database/app_database.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/database_provider.dart';
import 'sync/sync_engine.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Override sqlite3 to load the SQLCipher library before any DB code runs.
  // Must happen in the main isolate — overrides don't cross isolate boundaries.
  if (Platform.isAndroid) {
    await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
  }

  // Initialise encrypted database before the widget tree starts
  final storage = SecureStorage();
  final encryptionKey = await storage.getOrCreateDbKey();
  final db = AppDatabase(encryptionKey);

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
      ],
      child: const _AppEntryPoint(),
    ),
  );
}

class _AppEntryPoint extends ConsumerStatefulWidget {
  const _AppEntryPoint();

  @override
  ConsumerState<_AppEntryPoint> createState() => _AppEntryPointState();
}

class _AppEntryPointState extends ConsumerState<_AppEntryPoint> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Restore JWT session on cold start
      await ref.read(authProvider.notifier).loadCurrentUser();
      // Initialise sync engine — registers connectivity listener
      ref.read(syncEngineProvider);
    });
  }

  @override
  Widget build(BuildContext context) => const MFIApp();
}
