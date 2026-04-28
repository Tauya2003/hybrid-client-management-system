import 'package:drift/drift.dart';

class ClientsTable extends Table {
  @override
  String get tableName => 'clients';

  TextColumn get id => text()();
  TextColumn get nationalId => text().named('national_id')();
  TextColumn get phoneNumber => text().named('phone_number')();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  TextColumn get dateOfBirth => text().named('date_of_birth')();
  TextColumn get gender => text()();
  TextColumn get address => text()();
  TextColumn get photoPath => text().named('photo_path').nullable()();
  TextColumn get nextOfKinName => text().named('next_of_kin_name').withDefault(const Constant(''))();
  TextColumn get nextOfKinPhone => text().named('next_of_kin_phone').withDefault(const Constant(''))();
  TextColumn get branchId => text().named('branch_id')();
  TextColumn get createdById => text().named('created_by_id')();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();

  // Sync metadata
  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class GroupsTable extends Table {
  @override
  String get tableName => 'groups';

  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get groupType => text().named('group_type')();
  TextColumn get branchId => text().named('branch_id')();
  TextColumn get loanOfficerId => text().named('loan_officer_id')();
  TextColumn get meetingDay => text().named('meeting_day').withDefault(const Constant(''))();
  TextColumn get meetingFrequency => text().named('meeting_frequency').withDefault(const Constant(''))();
  TextColumn get meetingLocation => text().named('meeting_location').withDefault(const Constant(''))();
  BoolColumn get isActive => boolean().named('is_active').withDefault(const Constant(true))();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class GroupMembershipsTable extends Table {
  @override
  String get tableName => 'group_memberships';

  TextColumn get id => text()();
  TextColumn get groupId => text().named('group_id')();
  TextColumn get clientId => text().named('client_id')();
  TextColumn get role => text().withDefault(const Constant('member'))();
  TextColumn get joinedAt => text().named('joined_at')();

  TextColumn get syncStatus => text().named('sync_status').withDefault(const Constant('pending'))();
  TextColumn get createdAt => text().named('created_at')();
  TextColumn get updatedAt => text().named('updated_at')();
  IntColumn get version => integer().withDefault(const Constant(1))();
  BoolColumn get isDeleted => boolean().named('is_deleted').withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
