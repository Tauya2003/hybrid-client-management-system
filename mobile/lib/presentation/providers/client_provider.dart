import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../data/local/database/app_database.dart';
import 'auth_provider.dart';
import 'database_provider.dart';

const _uuid = Uuid();

final clientsStreamProvider = StreamProvider.family<List<ClientsTableData>, String?>(
  (ref, branchId) {
    final db = ref.watch(databaseProvider);
    return db.clientsDao.watchActiveClients(branchId: branchId);
  },
);

final clientDetailProvider = FutureProvider.family<ClientsTableData?, String>(
  (ref, id) async {
    final db = ref.watch(databaseProvider);
    return db.clientsDao.getClientById(id);
  },
);

final clientActionsProvider = Provider<ClientActions>((ref) {
  final db = ref.watch(databaseProvider);
  final user = ref.watch(authProvider).user;
  return ClientActions(db, user?.id ?? '', user?.branchId ?? '');
});

class ClientActions {
  final AppDatabase _db;
  final String _userId;
  final String _branchId;

  ClientActions(this._db, this._userId, this._branchId);

  Future<String> createClient({
    required String nationalId,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String gender,
    required String address,
    String nextOfKinName = '',
    String nextOfKinPhone = '',
    String? photoPath,
  }) async {
    if (_userId.isEmpty) {
      throw StateError(
        'Your session is missing user details. Please log out and log in again.',
      );
    }
    if (_branchId.isEmpty) {
      throw StateError(
        'Your account is not assigned to a branch. Please contact your admin.',
      );
    }

    final id = _uuid.v4();
    final now = DateTime.now().toUtc().toIso8601String();

    final companion = ClientsTableCompanion(
      id: Value(id),
      nationalId: Value(nationalId),
      phoneNumber: Value(phoneNumber),
      firstName: Value(firstName),
      lastName: Value(lastName),
      dateOfBirth: Value(dateOfBirth),
      gender: Value(gender),
      address: Value(address),
      photoPath: Value(photoPath),
      nextOfKinName: Value(nextOfKinName),
      nextOfKinPhone: Value(nextOfKinPhone),
      branchId: Value(_branchId),
      createdById: Value(_userId),
      syncStatus: const Value('pending'),
      createdAt: Value(now),
      updatedAt: Value(now),
    );

    await _db.clientsDao.upsertClient(companion);

    final payload = {
      'id': id,
      'national_id': nationalId,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'address': address,
      'next_of_kin_name': nextOfKinName,
      'next_of_kin_phone': nextOfKinPhone,
      'branch_id': _branchId,
      'created_by_id': _userId,
      'is_active': true,
      'updated_at': now,
      'version': 1,
      'is_deleted': false,
    };

    await _db.syncQueueDao.enqueue(SyncQueueTableCompanion(
      entityType: const Value('client'),
      entityId: Value(id),
      operation: const Value('create'),
      payload: Value(jsonEncode(payload)),
      createdAt: Value(now),
    ));

    return id;
  }

  Future<void> updateClient(
    String id, {
    required String address,
    required String nextOfKinName,
    required String nextOfKinPhone,
    String? photoPath,
  }) async {
    final existing = await _db.clientsDao.getClientById(id);
    if (existing == null) return;

    final now = DateTime.now().toUtc().toIso8601String();

    await _db.clientsDao.upsertClient(existing.toCompanion(true).copyWith(
          address: Value(address),
          nextOfKinName: Value(nextOfKinName),
          nextOfKinPhone: Value(nextOfKinPhone),
          photoPath: Value(photoPath),
          syncStatus: const Value('pending'),
          updatedAt: Value(now),
          version: Value(existing.version + 1),
        ));

    final payload = {
      'id': id,
      'address': address,
      'next_of_kin_name': nextOfKinName,
      'next_of_kin_phone': nextOfKinPhone,
      'updated_at': now,
      'version': existing.version + 1,
    };

    await _db.syncQueueDao.enqueue(SyncQueueTableCompanion(
      entityType: const Value('client'),
      entityId: Value(id),
      operation: const Value('update'),
      payload: Value(jsonEncode(payload)),
      createdAt: Value(now),
    ));
  }
}
