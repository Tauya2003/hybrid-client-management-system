// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ClientsTableTable extends ClientsTable
    with TableInfo<$ClientsTableTable, ClientsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nationalIdMeta =
      const VerificationMeta('nationalId');
  @override
  late final GeneratedColumn<String> nationalId = GeneratedColumn<String>(
      'national_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<String> dateOfBirth = GeneratedColumn<String>(
      'date_of_birth', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextOfKinNameMeta =
      const VerificationMeta('nextOfKinName');
  @override
  late final GeneratedColumn<String> nextOfKinName = GeneratedColumn<String>(
      'next_of_kin_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nextOfKinPhoneMeta =
      const VerificationMeta('nextOfKinPhone');
  @override
  late final GeneratedColumn<String> nextOfKinPhone = GeneratedColumn<String>(
      'next_of_kin_phone', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String> branchId = GeneratedColumn<String>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nationalId,
        phoneNumber,
        firstName,
        lastName,
        dateOfBirth,
        gender,
        address,
        photoPath,
        nextOfKinName,
        nextOfKinPhone,
        branchId,
        createdById,
        isActive,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<ClientsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('national_id')) {
      context.handle(
          _nationalIdMeta,
          nationalId.isAcceptableOrUnknown(
              data['national_id']!, _nationalIdMeta));
    } else if (isInserting) {
      context.missing(_nationalIdMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['date_of_birth']!, _dateOfBirthMeta));
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('next_of_kin_name')) {
      context.handle(
          _nextOfKinNameMeta,
          nextOfKinName.isAcceptableOrUnknown(
              data['next_of_kin_name']!, _nextOfKinNameMeta));
    }
    if (data.containsKey('next_of_kin_phone')) {
      context.handle(
          _nextOfKinPhoneMeta,
          nextOfKinPhone.isAcceptableOrUnknown(
              data['next_of_kin_phone']!, _nextOfKinPhoneMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    } else if (isInserting) {
      context.missing(_createdByIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClientsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      nationalId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}national_id'])!,
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      dateOfBirth: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_of_birth'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      nextOfKinName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}next_of_kin_name'])!,
      nextOfKinPhone: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}next_of_kin_phone'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_id'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $ClientsTableTable createAlias(String alias) {
    return $ClientsTableTable(attachedDatabase, alias);
  }
}

class ClientsTableData extends DataClass
    implements Insertable<ClientsTableData> {
  final String id;
  final String nationalId;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String? photoPath;
  final String nextOfKinName;
  final String nextOfKinPhone;
  final String branchId;
  final String createdById;
  final bool isActive;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const ClientsTableData(
      {required this.id,
      required this.nationalId,
      required this.phoneNumber,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.gender,
      required this.address,
      this.photoPath,
      required this.nextOfKinName,
      required this.nextOfKinPhone,
      required this.branchId,
      required this.createdById,
      required this.isActive,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['national_id'] = Variable<String>(nationalId);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['date_of_birth'] = Variable<String>(dateOfBirth);
    map['gender'] = Variable<String>(gender);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['next_of_kin_name'] = Variable<String>(nextOfKinName);
    map['next_of_kin_phone'] = Variable<String>(nextOfKinPhone);
    map['branch_id'] = Variable<String>(branchId);
    map['created_by_id'] = Variable<String>(createdById);
    map['is_active'] = Variable<bool>(isActive);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  ClientsTableCompanion toCompanion(bool nullToAbsent) {
    return ClientsTableCompanion(
      id: Value(id),
      nationalId: Value(nationalId),
      phoneNumber: Value(phoneNumber),
      firstName: Value(firstName),
      lastName: Value(lastName),
      dateOfBirth: Value(dateOfBirth),
      gender: Value(gender),
      address: Value(address),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      nextOfKinName: Value(nextOfKinName),
      nextOfKinPhone: Value(nextOfKinPhone),
      branchId: Value(branchId),
      createdById: Value(createdById),
      isActive: Value(isActive),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory ClientsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientsTableData(
      id: serializer.fromJson<String>(json['id']),
      nationalId: serializer.fromJson<String>(json['nationalId']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      dateOfBirth: serializer.fromJson<String>(json['dateOfBirth']),
      gender: serializer.fromJson<String>(json['gender']),
      address: serializer.fromJson<String>(json['address']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      nextOfKinName: serializer.fromJson<String>(json['nextOfKinName']),
      nextOfKinPhone: serializer.fromJson<String>(json['nextOfKinPhone']),
      branchId: serializer.fromJson<String>(json['branchId']),
      createdById: serializer.fromJson<String>(json['createdById']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'nationalId': serializer.toJson<String>(nationalId),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'dateOfBirth': serializer.toJson<String>(dateOfBirth),
      'gender': serializer.toJson<String>(gender),
      'address': serializer.toJson<String>(address),
      'photoPath': serializer.toJson<String?>(photoPath),
      'nextOfKinName': serializer.toJson<String>(nextOfKinName),
      'nextOfKinPhone': serializer.toJson<String>(nextOfKinPhone),
      'branchId': serializer.toJson<String>(branchId),
      'createdById': serializer.toJson<String>(createdById),
      'isActive': serializer.toJson<bool>(isActive),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  ClientsTableData copyWith(
          {String? id,
          String? nationalId,
          String? phoneNumber,
          String? firstName,
          String? lastName,
          String? dateOfBirth,
          String? gender,
          String? address,
          Value<String?> photoPath = const Value.absent(),
          String? nextOfKinName,
          String? nextOfKinPhone,
          String? branchId,
          String? createdById,
          bool? isActive,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      ClientsTableData(
        id: id ?? this.id,
        nationalId: nationalId ?? this.nationalId,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        nextOfKinName: nextOfKinName ?? this.nextOfKinName,
        nextOfKinPhone: nextOfKinPhone ?? this.nextOfKinPhone,
        branchId: branchId ?? this.branchId,
        createdById: createdById ?? this.createdById,
        isActive: isActive ?? this.isActive,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  ClientsTableData copyWithCompanion(ClientsTableCompanion data) {
    return ClientsTableData(
      id: data.id.present ? data.id.value : this.id,
      nationalId:
          data.nationalId.present ? data.nationalId.value : this.nationalId,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      gender: data.gender.present ? data.gender.value : this.gender,
      address: data.address.present ? data.address.value : this.address,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      nextOfKinName: data.nextOfKinName.present
          ? data.nextOfKinName.value
          : this.nextOfKinName,
      nextOfKinPhone: data.nextOfKinPhone.present
          ? data.nextOfKinPhone.value
          : this.nextOfKinPhone,
      branchId: data.branchId.present ? data.branchId.value : this.branchId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientsTableData(')
          ..write('id: $id, ')
          ..write('nationalId: $nationalId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('address: $address, ')
          ..write('photoPath: $photoPath, ')
          ..write('nextOfKinName: $nextOfKinName, ')
          ..write('nextOfKinPhone: $nextOfKinPhone, ')
          ..write('branchId: $branchId, ')
          ..write('createdById: $createdById, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      nationalId,
      phoneNumber,
      firstName,
      lastName,
      dateOfBirth,
      gender,
      address,
      photoPath,
      nextOfKinName,
      nextOfKinPhone,
      branchId,
      createdById,
      isActive,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientsTableData &&
          other.id == this.id &&
          other.nationalId == this.nationalId &&
          other.phoneNumber == this.phoneNumber &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.dateOfBirth == this.dateOfBirth &&
          other.gender == this.gender &&
          other.address == this.address &&
          other.photoPath == this.photoPath &&
          other.nextOfKinName == this.nextOfKinName &&
          other.nextOfKinPhone == this.nextOfKinPhone &&
          other.branchId == this.branchId &&
          other.createdById == this.createdById &&
          other.isActive == this.isActive &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class ClientsTableCompanion extends UpdateCompanion<ClientsTableData> {
  final Value<String> id;
  final Value<String> nationalId;
  final Value<String> phoneNumber;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> dateOfBirth;
  final Value<String> gender;
  final Value<String> address;
  final Value<String?> photoPath;
  final Value<String> nextOfKinName;
  final Value<String> nextOfKinPhone;
  final Value<String> branchId;
  final Value<String> createdById;
  final Value<bool> isActive;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const ClientsTableCompanion({
    this.id = const Value.absent(),
    this.nationalId = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.gender = const Value.absent(),
    this.address = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.nextOfKinName = const Value.absent(),
    this.nextOfKinPhone = const Value.absent(),
    this.branchId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientsTableCompanion.insert({
    required String id,
    required String nationalId,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String gender,
    required String address,
    this.photoPath = const Value.absent(),
    this.nextOfKinName = const Value.absent(),
    this.nextOfKinPhone = const Value.absent(),
    required String branchId,
    required String createdById,
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        nationalId = Value(nationalId),
        phoneNumber = Value(phoneNumber),
        firstName = Value(firstName),
        lastName = Value(lastName),
        dateOfBirth = Value(dateOfBirth),
        gender = Value(gender),
        address = Value(address),
        branchId = Value(branchId),
        createdById = Value(createdById),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ClientsTableData> custom({
    Expression<String>? id,
    Expression<String>? nationalId,
    Expression<String>? phoneNumber,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? dateOfBirth,
    Expression<String>? gender,
    Expression<String>? address,
    Expression<String>? photoPath,
    Expression<String>? nextOfKinName,
    Expression<String>? nextOfKinPhone,
    Expression<String>? branchId,
    Expression<String>? createdById,
    Expression<bool>? isActive,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nationalId != null) 'national_id': nationalId,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (gender != null) 'gender': gender,
      if (address != null) 'address': address,
      if (photoPath != null) 'photo_path': photoPath,
      if (nextOfKinName != null) 'next_of_kin_name': nextOfKinName,
      if (nextOfKinPhone != null) 'next_of_kin_phone': nextOfKinPhone,
      if (branchId != null) 'branch_id': branchId,
      if (createdById != null) 'created_by_id': createdById,
      if (isActive != null) 'is_active': isActive,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? nationalId,
      Value<String>? phoneNumber,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? dateOfBirth,
      Value<String>? gender,
      Value<String>? address,
      Value<String?>? photoPath,
      Value<String>? nextOfKinName,
      Value<String>? nextOfKinPhone,
      Value<String>? branchId,
      Value<String>? createdById,
      Value<bool>? isActive,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return ClientsTableCompanion(
      id: id ?? this.id,
      nationalId: nationalId ?? this.nationalId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      photoPath: photoPath ?? this.photoPath,
      nextOfKinName: nextOfKinName ?? this.nextOfKinName,
      nextOfKinPhone: nextOfKinPhone ?? this.nextOfKinPhone,
      branchId: branchId ?? this.branchId,
      createdById: createdById ?? this.createdById,
      isActive: isActive ?? this.isActive,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (nationalId.present) {
      map['national_id'] = Variable<String>(nationalId.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<String>(dateOfBirth.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (nextOfKinName.present) {
      map['next_of_kin_name'] = Variable<String>(nextOfKinName.value);
    }
    if (nextOfKinPhone.present) {
      map['next_of_kin_phone'] = Variable<String>(nextOfKinPhone.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String>(branchId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsTableCompanion(')
          ..write('id: $id, ')
          ..write('nationalId: $nationalId, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('gender: $gender, ')
          ..write('address: $address, ')
          ..write('photoPath: $photoPath, ')
          ..write('nextOfKinName: $nextOfKinName, ')
          ..write('nextOfKinPhone: $nextOfKinPhone, ')
          ..write('branchId: $branchId, ')
          ..write('createdById: $createdById, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupsTableTable extends GroupsTable
    with TableInfo<$GroupsTableTable, GroupsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupTypeMeta =
      const VerificationMeta('groupType');
  @override
  late final GeneratedColumn<String> groupType = GeneratedColumn<String>(
      'group_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String> branchId = GeneratedColumn<String>(
      'branch_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanOfficerIdMeta =
      const VerificationMeta('loanOfficerId');
  @override
  late final GeneratedColumn<String> loanOfficerId = GeneratedColumn<String>(
      'loan_officer_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _meetingDayMeta =
      const VerificationMeta('meetingDay');
  @override
  late final GeneratedColumn<String> meetingDay = GeneratedColumn<String>(
      'meeting_day', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _meetingFrequencyMeta =
      const VerificationMeta('meetingFrequency');
  @override
  late final GeneratedColumn<String> meetingFrequency = GeneratedColumn<String>(
      'meeting_frequency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _meetingLocationMeta =
      const VerificationMeta('meetingLocation');
  @override
  late final GeneratedColumn<String> meetingLocation = GeneratedColumn<String>(
      'meeting_location', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        groupType,
        branchId,
        loanOfficerId,
        meetingDay,
        meetingFrequency,
        meetingLocation,
        isActive,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(Insertable<GroupsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('group_type')) {
      context.handle(_groupTypeMeta,
          groupType.isAcceptableOrUnknown(data['group_type']!, _groupTypeMeta));
    } else if (isInserting) {
      context.missing(_groupTypeMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('loan_officer_id')) {
      context.handle(
          _loanOfficerIdMeta,
          loanOfficerId.isAcceptableOrUnknown(
              data['loan_officer_id']!, _loanOfficerIdMeta));
    } else if (isInserting) {
      context.missing(_loanOfficerIdMeta);
    }
    if (data.containsKey('meeting_day')) {
      context.handle(
          _meetingDayMeta,
          meetingDay.isAcceptableOrUnknown(
              data['meeting_day']!, _meetingDayMeta));
    }
    if (data.containsKey('meeting_frequency')) {
      context.handle(
          _meetingFrequencyMeta,
          meetingFrequency.isAcceptableOrUnknown(
              data['meeting_frequency']!, _meetingFrequencyMeta));
    }
    if (data.containsKey('meeting_location')) {
      context.handle(
          _meetingLocationMeta,
          meetingLocation.isAcceptableOrUnknown(
              data['meeting_location']!, _meetingLocationMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      groupType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_type'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_id'])!,
      loanOfficerId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}loan_officer_id'])!,
      meetingDay: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}meeting_day'])!,
      meetingFrequency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}meeting_frequency'])!,
      meetingLocation: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}meeting_location'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $GroupsTableTable createAlias(String alias) {
    return $GroupsTableTable(attachedDatabase, alias);
  }
}

class GroupsTableData extends DataClass implements Insertable<GroupsTableData> {
  final String id;
  final String name;
  final String groupType;
  final String branchId;
  final String loanOfficerId;
  final String meetingDay;
  final String meetingFrequency;
  final String meetingLocation;
  final bool isActive;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const GroupsTableData(
      {required this.id,
      required this.name,
      required this.groupType,
      required this.branchId,
      required this.loanOfficerId,
      required this.meetingDay,
      required this.meetingFrequency,
      required this.meetingLocation,
      required this.isActive,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['group_type'] = Variable<String>(groupType);
    map['branch_id'] = Variable<String>(branchId);
    map['loan_officer_id'] = Variable<String>(loanOfficerId);
    map['meeting_day'] = Variable<String>(meetingDay);
    map['meeting_frequency'] = Variable<String>(meetingFrequency);
    map['meeting_location'] = Variable<String>(meetingLocation);
    map['is_active'] = Variable<bool>(isActive);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  GroupsTableCompanion toCompanion(bool nullToAbsent) {
    return GroupsTableCompanion(
      id: Value(id),
      name: Value(name),
      groupType: Value(groupType),
      branchId: Value(branchId),
      loanOfficerId: Value(loanOfficerId),
      meetingDay: Value(meetingDay),
      meetingFrequency: Value(meetingFrequency),
      meetingLocation: Value(meetingLocation),
      isActive: Value(isActive),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory GroupsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      groupType: serializer.fromJson<String>(json['groupType']),
      branchId: serializer.fromJson<String>(json['branchId']),
      loanOfficerId: serializer.fromJson<String>(json['loanOfficerId']),
      meetingDay: serializer.fromJson<String>(json['meetingDay']),
      meetingFrequency: serializer.fromJson<String>(json['meetingFrequency']),
      meetingLocation: serializer.fromJson<String>(json['meetingLocation']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'groupType': serializer.toJson<String>(groupType),
      'branchId': serializer.toJson<String>(branchId),
      'loanOfficerId': serializer.toJson<String>(loanOfficerId),
      'meetingDay': serializer.toJson<String>(meetingDay),
      'meetingFrequency': serializer.toJson<String>(meetingFrequency),
      'meetingLocation': serializer.toJson<String>(meetingLocation),
      'isActive': serializer.toJson<bool>(isActive),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  GroupsTableData copyWith(
          {String? id,
          String? name,
          String? groupType,
          String? branchId,
          String? loanOfficerId,
          String? meetingDay,
          String? meetingFrequency,
          String? meetingLocation,
          bool? isActive,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      GroupsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        groupType: groupType ?? this.groupType,
        branchId: branchId ?? this.branchId,
        loanOfficerId: loanOfficerId ?? this.loanOfficerId,
        meetingDay: meetingDay ?? this.meetingDay,
        meetingFrequency: meetingFrequency ?? this.meetingFrequency,
        meetingLocation: meetingLocation ?? this.meetingLocation,
        isActive: isActive ?? this.isActive,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  GroupsTableData copyWithCompanion(GroupsTableCompanion data) {
    return GroupsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      groupType: data.groupType.present ? data.groupType.value : this.groupType,
      branchId: data.branchId.present ? data.branchId.value : this.branchId,
      loanOfficerId: data.loanOfficerId.present
          ? data.loanOfficerId.value
          : this.loanOfficerId,
      meetingDay:
          data.meetingDay.present ? data.meetingDay.value : this.meetingDay,
      meetingFrequency: data.meetingFrequency.present
          ? data.meetingFrequency.value
          : this.meetingFrequency,
      meetingLocation: data.meetingLocation.present
          ? data.meetingLocation.value
          : this.meetingLocation,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupType: $groupType, ')
          ..write('branchId: $branchId, ')
          ..write('loanOfficerId: $loanOfficerId, ')
          ..write('meetingDay: $meetingDay, ')
          ..write('meetingFrequency: $meetingFrequency, ')
          ..write('meetingLocation: $meetingLocation, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      groupType,
      branchId,
      loanOfficerId,
      meetingDay,
      meetingFrequency,
      meetingLocation,
      isActive,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.groupType == this.groupType &&
          other.branchId == this.branchId &&
          other.loanOfficerId == this.loanOfficerId &&
          other.meetingDay == this.meetingDay &&
          other.meetingFrequency == this.meetingFrequency &&
          other.meetingLocation == this.meetingLocation &&
          other.isActive == this.isActive &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class GroupsTableCompanion extends UpdateCompanion<GroupsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> groupType;
  final Value<String> branchId;
  final Value<String> loanOfficerId;
  final Value<String> meetingDay;
  final Value<String> meetingFrequency;
  final Value<String> meetingLocation;
  final Value<bool> isActive;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const GroupsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.groupType = const Value.absent(),
    this.branchId = const Value.absent(),
    this.loanOfficerId = const Value.absent(),
    this.meetingDay = const Value.absent(),
    this.meetingFrequency = const Value.absent(),
    this.meetingLocation = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupsTableCompanion.insert({
    required String id,
    required String name,
    required String groupType,
    required String branchId,
    required String loanOfficerId,
    this.meetingDay = const Value.absent(),
    this.meetingFrequency = const Value.absent(),
    this.meetingLocation = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        groupType = Value(groupType),
        branchId = Value(branchId),
        loanOfficerId = Value(loanOfficerId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? groupType,
    Expression<String>? branchId,
    Expression<String>? loanOfficerId,
    Expression<String>? meetingDay,
    Expression<String>? meetingFrequency,
    Expression<String>? meetingLocation,
    Expression<bool>? isActive,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (groupType != null) 'group_type': groupType,
      if (branchId != null) 'branch_id': branchId,
      if (loanOfficerId != null) 'loan_officer_id': loanOfficerId,
      if (meetingDay != null) 'meeting_day': meetingDay,
      if (meetingFrequency != null) 'meeting_frequency': meetingFrequency,
      if (meetingLocation != null) 'meeting_location': meetingLocation,
      if (isActive != null) 'is_active': isActive,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? groupType,
      Value<String>? branchId,
      Value<String>? loanOfficerId,
      Value<String>? meetingDay,
      Value<String>? meetingFrequency,
      Value<String>? meetingLocation,
      Value<bool>? isActive,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return GroupsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      groupType: groupType ?? this.groupType,
      branchId: branchId ?? this.branchId,
      loanOfficerId: loanOfficerId ?? this.loanOfficerId,
      meetingDay: meetingDay ?? this.meetingDay,
      meetingFrequency: meetingFrequency ?? this.meetingFrequency,
      meetingLocation: meetingLocation ?? this.meetingLocation,
      isActive: isActive ?? this.isActive,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (groupType.present) {
      map['group_type'] = Variable<String>(groupType.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String>(branchId.value);
    }
    if (loanOfficerId.present) {
      map['loan_officer_id'] = Variable<String>(loanOfficerId.value);
    }
    if (meetingDay.present) {
      map['meeting_day'] = Variable<String>(meetingDay.value);
    }
    if (meetingFrequency.present) {
      map['meeting_frequency'] = Variable<String>(meetingFrequency.value);
    }
    if (meetingLocation.present) {
      map['meeting_location'] = Variable<String>(meetingLocation.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('groupType: $groupType, ')
          ..write('branchId: $branchId, ')
          ..write('loanOfficerId: $loanOfficerId, ')
          ..write('meetingDay: $meetingDay, ')
          ..write('meetingFrequency: $meetingFrequency, ')
          ..write('meetingLocation: $meetingLocation, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroupMembershipsTableTable extends GroupMembershipsTable
    with TableInfo<$GroupMembershipsTableTable, GroupMembershipsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupMembershipsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('member'));
  static const VerificationMeta _joinedAtMeta =
      const VerificationMeta('joinedAt');
  @override
  late final GeneratedColumn<String> joinedAt = GeneratedColumn<String>(
      'joined_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        groupId,
        clientId,
        role,
        joinedAt,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'group_memberships';
  @override
  VerificationContext validateIntegrity(
      Insertable<GroupMembershipsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    }
    if (data.containsKey('joined_at')) {
      context.handle(_joinedAtMeta,
          joinedAt.isAcceptableOrUnknown(data['joined_at']!, _joinedAtMeta));
    } else if (isInserting) {
      context.missing(_joinedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroupMembershipsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroupMembershipsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      joinedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}joined_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $GroupMembershipsTableTable createAlias(String alias) {
    return $GroupMembershipsTableTable(attachedDatabase, alias);
  }
}

class GroupMembershipsTableData extends DataClass
    implements Insertable<GroupMembershipsTableData> {
  final String id;
  final String groupId;
  final String clientId;
  final String role;
  final String joinedAt;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const GroupMembershipsTableData(
      {required this.id,
      required this.groupId,
      required this.clientId,
      required this.role,
      required this.joinedAt,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['group_id'] = Variable<String>(groupId);
    map['client_id'] = Variable<String>(clientId);
    map['role'] = Variable<String>(role);
    map['joined_at'] = Variable<String>(joinedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  GroupMembershipsTableCompanion toCompanion(bool nullToAbsent) {
    return GroupMembershipsTableCompanion(
      id: Value(id),
      groupId: Value(groupId),
      clientId: Value(clientId),
      role: Value(role),
      joinedAt: Value(joinedAt),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory GroupMembershipsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroupMembershipsTableData(
      id: serializer.fromJson<String>(json['id']),
      groupId: serializer.fromJson<String>(json['groupId']),
      clientId: serializer.fromJson<String>(json['clientId']),
      role: serializer.fromJson<String>(json['role']),
      joinedAt: serializer.fromJson<String>(json['joinedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'groupId': serializer.toJson<String>(groupId),
      'clientId': serializer.toJson<String>(clientId),
      'role': serializer.toJson<String>(role),
      'joinedAt': serializer.toJson<String>(joinedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  GroupMembershipsTableData copyWith(
          {String? id,
          String? groupId,
          String? clientId,
          String? role,
          String? joinedAt,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      GroupMembershipsTableData(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        clientId: clientId ?? this.clientId,
        role: role ?? this.role,
        joinedAt: joinedAt ?? this.joinedAt,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  GroupMembershipsTableData copyWithCompanion(
      GroupMembershipsTableCompanion data) {
    return GroupMembershipsTableData(
      id: data.id.present ? data.id.value : this.id,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      role: data.role.present ? data.role.value : this.role,
      joinedAt: data.joinedAt.present ? data.joinedAt.value : this.joinedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroupMembershipsTableData(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('clientId: $clientId, ')
          ..write('role: $role, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, groupId, clientId, role, joinedAt,
      syncStatus, createdAt, updatedAt, version, isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupMembershipsTableData &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.clientId == this.clientId &&
          other.role == this.role &&
          other.joinedAt == this.joinedAt &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class GroupMembershipsTableCompanion
    extends UpdateCompanion<GroupMembershipsTableData> {
  final Value<String> id;
  final Value<String> groupId;
  final Value<String> clientId;
  final Value<String> role;
  final Value<String> joinedAt;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const GroupMembershipsTableCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.role = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroupMembershipsTableCompanion.insert({
    required String id,
    required String groupId,
    required String clientId,
    this.role = const Value.absent(),
    required String joinedAt,
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        groupId = Value(groupId),
        clientId = Value(clientId),
        joinedAt = Value(joinedAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupMembershipsTableData> custom({
    Expression<String>? id,
    Expression<String>? groupId,
    Expression<String>? clientId,
    Expression<String>? role,
    Expression<String>? joinedAt,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (clientId != null) 'client_id': clientId,
      if (role != null) 'role': role,
      if (joinedAt != null) 'joined_at': joinedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroupMembershipsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? groupId,
      Value<String>? clientId,
      Value<String>? role,
      Value<String>? joinedAt,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return GroupMembershipsTableCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      clientId: clientId ?? this.clientId,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (joinedAt.present) {
      map['joined_at'] = Variable<String>(joinedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupMembershipsTableCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('clientId: $clientId, ')
          ..write('role: $role, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoanProductsTableTable extends LoanProductsTable
    with TableInfo<$LoanProductsTableTable, LoanProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _minAmountMeta =
      const VerificationMeta('minAmount');
  @override
  late final GeneratedColumn<double> minAmount = GeneratedColumn<double>(
      'min_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _maxAmountMeta =
      const VerificationMeta('maxAmount');
  @override
  late final GeneratedColumn<double> maxAmount = GeneratedColumn<double>(
      'max_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _interestRateMeta =
      const VerificationMeta('interestRate');
  @override
  late final GeneratedColumn<double> interestRate = GeneratedColumn<double>(
      'interest_rate', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _interestTypeMeta =
      const VerificationMeta('interestType');
  @override
  late final GeneratedColumn<String> interestType = GeneratedColumn<String>(
      'interest_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repaymentFrequencyMeta =
      const VerificationMeta('repaymentFrequency');
  @override
  late final GeneratedColumn<String> repaymentFrequency =
      GeneratedColumn<String>('repayment_frequency', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _minTermMeta =
      const VerificationMeta('minTerm');
  @override
  late final GeneratedColumn<int> minTerm = GeneratedColumn<int>(
      'min_term', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxTermMeta =
      const VerificationMeta('maxTerm');
  @override
  late final GeneratedColumn<int> maxTerm = GeneratedColumn<int>(
      'max_term', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _processingFeeRateMeta =
      const VerificationMeta('processingFeeRate');
  @override
  late final GeneratedColumn<double> processingFeeRate =
      GeneratedColumn<double>('processing_fee_rate', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _syncedAtMeta =
      const VerificationMeta('syncedAt');
  @override
  late final GeneratedColumn<String> syncedAt = GeneratedColumn<String>(
      'synced_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        minAmount,
        maxAmount,
        interestRate,
        interestType,
        repaymentFrequency,
        minTerm,
        maxTerm,
        processingFeeRate,
        isActive,
        syncedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_products';
  @override
  VerificationContext validateIntegrity(
      Insertable<LoanProductsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('min_amount')) {
      context.handle(_minAmountMeta,
          minAmount.isAcceptableOrUnknown(data['min_amount']!, _minAmountMeta));
    } else if (isInserting) {
      context.missing(_minAmountMeta);
    }
    if (data.containsKey('max_amount')) {
      context.handle(_maxAmountMeta,
          maxAmount.isAcceptableOrUnknown(data['max_amount']!, _maxAmountMeta));
    } else if (isInserting) {
      context.missing(_maxAmountMeta);
    }
    if (data.containsKey('interest_rate')) {
      context.handle(
          _interestRateMeta,
          interestRate.isAcceptableOrUnknown(
              data['interest_rate']!, _interestRateMeta));
    } else if (isInserting) {
      context.missing(_interestRateMeta);
    }
    if (data.containsKey('interest_type')) {
      context.handle(
          _interestTypeMeta,
          interestType.isAcceptableOrUnknown(
              data['interest_type']!, _interestTypeMeta));
    } else if (isInserting) {
      context.missing(_interestTypeMeta);
    }
    if (data.containsKey('repayment_frequency')) {
      context.handle(
          _repaymentFrequencyMeta,
          repaymentFrequency.isAcceptableOrUnknown(
              data['repayment_frequency']!, _repaymentFrequencyMeta));
    } else if (isInserting) {
      context.missing(_repaymentFrequencyMeta);
    }
    if (data.containsKey('min_term')) {
      context.handle(_minTermMeta,
          minTerm.isAcceptableOrUnknown(data['min_term']!, _minTermMeta));
    } else if (isInserting) {
      context.missing(_minTermMeta);
    }
    if (data.containsKey('max_term')) {
      context.handle(_maxTermMeta,
          maxTerm.isAcceptableOrUnknown(data['max_term']!, _maxTermMeta));
    } else if (isInserting) {
      context.missing(_maxTermMeta);
    }
    if (data.containsKey('processing_fee_rate')) {
      context.handle(
          _processingFeeRateMeta,
          processingFeeRate.isAcceptableOrUnknown(
              data['processing_fee_rate']!, _processingFeeRateMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('synced_at')) {
      context.handle(_syncedAtMeta,
          syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoanProductsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanProductsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      minAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_amount'])!,
      maxAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_amount'])!,
      interestRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interest_rate'])!,
      interestType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}interest_type'])!,
      repaymentFrequency: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}repayment_frequency'])!,
      minTerm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_term'])!,
      maxTerm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_term'])!,
      processingFeeRate: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}processing_fee_rate'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      syncedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}synced_at']),
    );
  }

  @override
  $LoanProductsTableTable createAlias(String alias) {
    return $LoanProductsTableTable(attachedDatabase, alias);
  }
}

class LoanProductsTableData extends DataClass
    implements Insertable<LoanProductsTableData> {
  final String id;
  final String name;
  final String description;
  final double minAmount;
  final double maxAmount;
  final double interestRate;
  final String interestType;
  final String repaymentFrequency;
  final int minTerm;
  final int maxTerm;
  final double processingFeeRate;
  final bool isActive;
  final String? syncedAt;
  const LoanProductsTableData(
      {required this.id,
      required this.name,
      required this.description,
      required this.minAmount,
      required this.maxAmount,
      required this.interestRate,
      required this.interestType,
      required this.repaymentFrequency,
      required this.minTerm,
      required this.maxTerm,
      required this.processingFeeRate,
      required this.isActive,
      this.syncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['min_amount'] = Variable<double>(minAmount);
    map['max_amount'] = Variable<double>(maxAmount);
    map['interest_rate'] = Variable<double>(interestRate);
    map['interest_type'] = Variable<String>(interestType);
    map['repayment_frequency'] = Variable<String>(repaymentFrequency);
    map['min_term'] = Variable<int>(minTerm);
    map['max_term'] = Variable<int>(maxTerm);
    map['processing_fee_rate'] = Variable<double>(processingFeeRate);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<String>(syncedAt);
    }
    return map;
  }

  LoanProductsTableCompanion toCompanion(bool nullToAbsent) {
    return LoanProductsTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      minAmount: Value(minAmount),
      maxAmount: Value(maxAmount),
      interestRate: Value(interestRate),
      interestType: Value(interestType),
      repaymentFrequency: Value(repaymentFrequency),
      minTerm: Value(minTerm),
      maxTerm: Value(maxTerm),
      processingFeeRate: Value(processingFeeRate),
      isActive: Value(isActive),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
    );
  }

  factory LoanProductsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanProductsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      minAmount: serializer.fromJson<double>(json['minAmount']),
      maxAmount: serializer.fromJson<double>(json['maxAmount']),
      interestRate: serializer.fromJson<double>(json['interestRate']),
      interestType: serializer.fromJson<String>(json['interestType']),
      repaymentFrequency:
          serializer.fromJson<String>(json['repaymentFrequency']),
      minTerm: serializer.fromJson<int>(json['minTerm']),
      maxTerm: serializer.fromJson<int>(json['maxTerm']),
      processingFeeRate: serializer.fromJson<double>(json['processingFeeRate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      syncedAt: serializer.fromJson<String?>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'minAmount': serializer.toJson<double>(minAmount),
      'maxAmount': serializer.toJson<double>(maxAmount),
      'interestRate': serializer.toJson<double>(interestRate),
      'interestType': serializer.toJson<String>(interestType),
      'repaymentFrequency': serializer.toJson<String>(repaymentFrequency),
      'minTerm': serializer.toJson<int>(minTerm),
      'maxTerm': serializer.toJson<int>(maxTerm),
      'processingFeeRate': serializer.toJson<double>(processingFeeRate),
      'isActive': serializer.toJson<bool>(isActive),
      'syncedAt': serializer.toJson<String?>(syncedAt),
    };
  }

  LoanProductsTableData copyWith(
          {String? id,
          String? name,
          String? description,
          double? minAmount,
          double? maxAmount,
          double? interestRate,
          String? interestType,
          String? repaymentFrequency,
          int? minTerm,
          int? maxTerm,
          double? processingFeeRate,
          bool? isActive,
          Value<String?> syncedAt = const Value.absent()}) =>
      LoanProductsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        minAmount: minAmount ?? this.minAmount,
        maxAmount: maxAmount ?? this.maxAmount,
        interestRate: interestRate ?? this.interestRate,
        interestType: interestType ?? this.interestType,
        repaymentFrequency: repaymentFrequency ?? this.repaymentFrequency,
        minTerm: minTerm ?? this.minTerm,
        maxTerm: maxTerm ?? this.maxTerm,
        processingFeeRate: processingFeeRate ?? this.processingFeeRate,
        isActive: isActive ?? this.isActive,
        syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
      );
  LoanProductsTableData copyWithCompanion(LoanProductsTableCompanion data) {
    return LoanProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      minAmount: data.minAmount.present ? data.minAmount.value : this.minAmount,
      maxAmount: data.maxAmount.present ? data.maxAmount.value : this.maxAmount,
      interestRate: data.interestRate.present
          ? data.interestRate.value
          : this.interestRate,
      interestType: data.interestType.present
          ? data.interestType.value
          : this.interestType,
      repaymentFrequency: data.repaymentFrequency.present
          ? data.repaymentFrequency.value
          : this.repaymentFrequency,
      minTerm: data.minTerm.present ? data.minTerm.value : this.minTerm,
      maxTerm: data.maxTerm.present ? data.maxTerm.value : this.maxTerm,
      processingFeeRate: data.processingFeeRate.present
          ? data.processingFeeRate.value
          : this.processingFeeRate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanProductsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('minAmount: $minAmount, ')
          ..write('maxAmount: $maxAmount, ')
          ..write('interestRate: $interestRate, ')
          ..write('interestType: $interestType, ')
          ..write('repaymentFrequency: $repaymentFrequency, ')
          ..write('minTerm: $minTerm, ')
          ..write('maxTerm: $maxTerm, ')
          ..write('processingFeeRate: $processingFeeRate, ')
          ..write('isActive: $isActive, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      minAmount,
      maxAmount,
      interestRate,
      interestType,
      repaymentFrequency,
      minTerm,
      maxTerm,
      processingFeeRate,
      isActive,
      syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanProductsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.minAmount == this.minAmount &&
          other.maxAmount == this.maxAmount &&
          other.interestRate == this.interestRate &&
          other.interestType == this.interestType &&
          other.repaymentFrequency == this.repaymentFrequency &&
          other.minTerm == this.minTerm &&
          other.maxTerm == this.maxTerm &&
          other.processingFeeRate == this.processingFeeRate &&
          other.isActive == this.isActive &&
          other.syncedAt == this.syncedAt);
}

class LoanProductsTableCompanion
    extends UpdateCompanion<LoanProductsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> minAmount;
  final Value<double> maxAmount;
  final Value<double> interestRate;
  final Value<String> interestType;
  final Value<String> repaymentFrequency;
  final Value<int> minTerm;
  final Value<int> maxTerm;
  final Value<double> processingFeeRate;
  final Value<bool> isActive;
  final Value<String?> syncedAt;
  final Value<int> rowid;
  const LoanProductsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.minAmount = const Value.absent(),
    this.maxAmount = const Value.absent(),
    this.interestRate = const Value.absent(),
    this.interestType = const Value.absent(),
    this.repaymentFrequency = const Value.absent(),
    this.minTerm = const Value.absent(),
    this.maxTerm = const Value.absent(),
    this.processingFeeRate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoanProductsTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required double minAmount,
    required double maxAmount,
    required double interestRate,
    required String interestType,
    required String repaymentFrequency,
    required int minTerm,
    required int maxTerm,
    this.processingFeeRate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        minAmount = Value(minAmount),
        maxAmount = Value(maxAmount),
        interestRate = Value(interestRate),
        interestType = Value(interestType),
        repaymentFrequency = Value(repaymentFrequency),
        minTerm = Value(minTerm),
        maxTerm = Value(maxTerm);
  static Insertable<LoanProductsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? minAmount,
    Expression<double>? maxAmount,
    Expression<double>? interestRate,
    Expression<String>? interestType,
    Expression<String>? repaymentFrequency,
    Expression<int>? minTerm,
    Expression<int>? maxTerm,
    Expression<double>? processingFeeRate,
    Expression<bool>? isActive,
    Expression<String>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (minAmount != null) 'min_amount': minAmount,
      if (maxAmount != null) 'max_amount': maxAmount,
      if (interestRate != null) 'interest_rate': interestRate,
      if (interestType != null) 'interest_type': interestType,
      if (repaymentFrequency != null) 'repayment_frequency': repaymentFrequency,
      if (minTerm != null) 'min_term': minTerm,
      if (maxTerm != null) 'max_term': maxTerm,
      if (processingFeeRate != null) 'processing_fee_rate': processingFeeRate,
      if (isActive != null) 'is_active': isActive,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoanProductsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<double>? minAmount,
      Value<double>? maxAmount,
      Value<double>? interestRate,
      Value<String>? interestType,
      Value<String>? repaymentFrequency,
      Value<int>? minTerm,
      Value<int>? maxTerm,
      Value<double>? processingFeeRate,
      Value<bool>? isActive,
      Value<String?>? syncedAt,
      Value<int>? rowid}) {
    return LoanProductsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      minAmount: minAmount ?? this.minAmount,
      maxAmount: maxAmount ?? this.maxAmount,
      interestRate: interestRate ?? this.interestRate,
      interestType: interestType ?? this.interestType,
      repaymentFrequency: repaymentFrequency ?? this.repaymentFrequency,
      minTerm: minTerm ?? this.minTerm,
      maxTerm: maxTerm ?? this.maxTerm,
      processingFeeRate: processingFeeRate ?? this.processingFeeRate,
      isActive: isActive ?? this.isActive,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (minAmount.present) {
      map['min_amount'] = Variable<double>(minAmount.value);
    }
    if (maxAmount.present) {
      map['max_amount'] = Variable<double>(maxAmount.value);
    }
    if (interestRate.present) {
      map['interest_rate'] = Variable<double>(interestRate.value);
    }
    if (interestType.present) {
      map['interest_type'] = Variable<String>(interestType.value);
    }
    if (repaymentFrequency.present) {
      map['repayment_frequency'] = Variable<String>(repaymentFrequency.value);
    }
    if (minTerm.present) {
      map['min_term'] = Variable<int>(minTerm.value);
    }
    if (maxTerm.present) {
      map['max_term'] = Variable<int>(maxTerm.value);
    }
    if (processingFeeRate.present) {
      map['processing_fee_rate'] = Variable<double>(processingFeeRate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<String>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('minAmount: $minAmount, ')
          ..write('maxAmount: $maxAmount, ')
          ..write('interestRate: $interestRate, ')
          ..write('interestType: $interestType, ')
          ..write('repaymentFrequency: $repaymentFrequency, ')
          ..write('minTerm: $minTerm, ')
          ..write('maxTerm: $maxTerm, ')
          ..write('processingFeeRate: $processingFeeRate, ')
          ..write('isActive: $isActive, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoanApplicationsTableTable extends LoanApplicationsTable
    with TableInfo<$LoanApplicationsTableTable, LoanApplicationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoanApplicationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loanProductIdMeta =
      const VerificationMeta('loanProductId');
  @override
  late final GeneratedColumn<String> loanProductId = GeneratedColumn<String>(
      'loan_product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanProductNameMeta =
      const VerificationMeta('loanProductName');
  @override
  late final GeneratedColumn<String> loanProductName = GeneratedColumn<String>(
      'loan_product_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _amountRequestedMeta =
      const VerificationMeta('amountRequested');
  @override
  late final GeneratedColumn<double> amountRequested = GeneratedColumn<double>(
      'amount_requested', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _termMeta = const VerificationMeta('term');
  @override
  late final GeneratedColumn<int> term = GeneratedColumn<int>(
      'term', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _purposeMeta =
      const VerificationMeta('purpose');
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
      'purpose', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _appliedByIdMeta =
      const VerificationMeta('appliedById');
  @override
  late final GeneratedColumn<String> appliedById = GeneratedColumn<String>(
      'applied_by_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _appliedAtMeta =
      const VerificationMeta('appliedAt');
  @override
  late final GeneratedColumn<String> appliedAt = GeneratedColumn<String>(
      'applied_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _rejectionReasonMeta =
      const VerificationMeta('rejectionReason');
  @override
  late final GeneratedColumn<String> rejectionReason = GeneratedColumn<String>(
      'rejection_reason', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        clientId,
        groupId,
        loanProductId,
        loanProductName,
        amountRequested,
        term,
        purpose,
        status,
        appliedById,
        appliedAt,
        notes,
        rejectionReason,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loan_applications';
  @override
  VerificationContext validateIntegrity(
      Insertable<LoanApplicationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    }
    if (data.containsKey('loan_product_id')) {
      context.handle(
          _loanProductIdMeta,
          loanProductId.isAcceptableOrUnknown(
              data['loan_product_id']!, _loanProductIdMeta));
    } else if (isInserting) {
      context.missing(_loanProductIdMeta);
    }
    if (data.containsKey('loan_product_name')) {
      context.handle(
          _loanProductNameMeta,
          loanProductName.isAcceptableOrUnknown(
              data['loan_product_name']!, _loanProductNameMeta));
    }
    if (data.containsKey('amount_requested')) {
      context.handle(
          _amountRequestedMeta,
          amountRequested.isAcceptableOrUnknown(
              data['amount_requested']!, _amountRequestedMeta));
    } else if (isInserting) {
      context.missing(_amountRequestedMeta);
    }
    if (data.containsKey('term')) {
      context.handle(
          _termMeta, term.isAcceptableOrUnknown(data['term']!, _termMeta));
    } else if (isInserting) {
      context.missing(_termMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    } else if (isInserting) {
      context.missing(_purposeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('applied_by_id')) {
      context.handle(
          _appliedByIdMeta,
          appliedById.isAcceptableOrUnknown(
              data['applied_by_id']!, _appliedByIdMeta));
    } else if (isInserting) {
      context.missing(_appliedByIdMeta);
    }
    if (data.containsKey('applied_at')) {
      context.handle(_appliedAtMeta,
          appliedAt.isAcceptableOrUnknown(data['applied_at']!, _appliedAtMeta));
    } else if (isInserting) {
      context.missing(_appliedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('rejection_reason')) {
      context.handle(
          _rejectionReasonMeta,
          rejectionReason.isAcceptableOrUnknown(
              data['rejection_reason']!, _rejectionReasonMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoanApplicationsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoanApplicationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id']),
      loanProductId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}loan_product_id'])!,
      loanProductName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}loan_product_name'])!,
      amountRequested: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}amount_requested'])!,
      term: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}term'])!,
      purpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purpose'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      appliedById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}applied_by_id'])!,
      appliedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}applied_at'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      rejectionReason: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}rejection_reason'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $LoanApplicationsTableTable createAlias(String alias) {
    return $LoanApplicationsTableTable(attachedDatabase, alias);
  }
}

class LoanApplicationsTableData extends DataClass
    implements Insertable<LoanApplicationsTableData> {
  final String id;
  final String clientId;
  final String? groupId;
  final String loanProductId;
  final String loanProductName;
  final double amountRequested;
  final int term;
  final String purpose;
  final String status;
  final String appliedById;
  final String appliedAt;
  final String notes;
  final String rejectionReason;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const LoanApplicationsTableData(
      {required this.id,
      required this.clientId,
      this.groupId,
      required this.loanProductId,
      required this.loanProductName,
      required this.amountRequested,
      required this.term,
      required this.purpose,
      required this.status,
      required this.appliedById,
      required this.appliedAt,
      required this.notes,
      required this.rejectionReason,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<String>(groupId);
    }
    map['loan_product_id'] = Variable<String>(loanProductId);
    map['loan_product_name'] = Variable<String>(loanProductName);
    map['amount_requested'] = Variable<double>(amountRequested);
    map['term'] = Variable<int>(term);
    map['purpose'] = Variable<String>(purpose);
    map['status'] = Variable<String>(status);
    map['applied_by_id'] = Variable<String>(appliedById);
    map['applied_at'] = Variable<String>(appliedAt);
    map['notes'] = Variable<String>(notes);
    map['rejection_reason'] = Variable<String>(rejectionReason);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  LoanApplicationsTableCompanion toCompanion(bool nullToAbsent) {
    return LoanApplicationsTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      loanProductId: Value(loanProductId),
      loanProductName: Value(loanProductName),
      amountRequested: Value(amountRequested),
      term: Value(term),
      purpose: Value(purpose),
      status: Value(status),
      appliedById: Value(appliedById),
      appliedAt: Value(appliedAt),
      notes: Value(notes),
      rejectionReason: Value(rejectionReason),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory LoanApplicationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoanApplicationsTableData(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      groupId: serializer.fromJson<String?>(json['groupId']),
      loanProductId: serializer.fromJson<String>(json['loanProductId']),
      loanProductName: serializer.fromJson<String>(json['loanProductName']),
      amountRequested: serializer.fromJson<double>(json['amountRequested']),
      term: serializer.fromJson<int>(json['term']),
      purpose: serializer.fromJson<String>(json['purpose']),
      status: serializer.fromJson<String>(json['status']),
      appliedById: serializer.fromJson<String>(json['appliedById']),
      appliedAt: serializer.fromJson<String>(json['appliedAt']),
      notes: serializer.fromJson<String>(json['notes']),
      rejectionReason: serializer.fromJson<String>(json['rejectionReason']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'groupId': serializer.toJson<String?>(groupId),
      'loanProductId': serializer.toJson<String>(loanProductId),
      'loanProductName': serializer.toJson<String>(loanProductName),
      'amountRequested': serializer.toJson<double>(amountRequested),
      'term': serializer.toJson<int>(term),
      'purpose': serializer.toJson<String>(purpose),
      'status': serializer.toJson<String>(status),
      'appliedById': serializer.toJson<String>(appliedById),
      'appliedAt': serializer.toJson<String>(appliedAt),
      'notes': serializer.toJson<String>(notes),
      'rejectionReason': serializer.toJson<String>(rejectionReason),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  LoanApplicationsTableData copyWith(
          {String? id,
          String? clientId,
          Value<String?> groupId = const Value.absent(),
          String? loanProductId,
          String? loanProductName,
          double? amountRequested,
          int? term,
          String? purpose,
          String? status,
          String? appliedById,
          String? appliedAt,
          String? notes,
          String? rejectionReason,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      LoanApplicationsTableData(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        groupId: groupId.present ? groupId.value : this.groupId,
        loanProductId: loanProductId ?? this.loanProductId,
        loanProductName: loanProductName ?? this.loanProductName,
        amountRequested: amountRequested ?? this.amountRequested,
        term: term ?? this.term,
        purpose: purpose ?? this.purpose,
        status: status ?? this.status,
        appliedById: appliedById ?? this.appliedById,
        appliedAt: appliedAt ?? this.appliedAt,
        notes: notes ?? this.notes,
        rejectionReason: rejectionReason ?? this.rejectionReason,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  LoanApplicationsTableData copyWithCompanion(
      LoanApplicationsTableCompanion data) {
    return LoanApplicationsTableData(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      loanProductId: data.loanProductId.present
          ? data.loanProductId.value
          : this.loanProductId,
      loanProductName: data.loanProductName.present
          ? data.loanProductName.value
          : this.loanProductName,
      amountRequested: data.amountRequested.present
          ? data.amountRequested.value
          : this.amountRequested,
      term: data.term.present ? data.term.value : this.term,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      status: data.status.present ? data.status.value : this.status,
      appliedById:
          data.appliedById.present ? data.appliedById.value : this.appliedById,
      appliedAt: data.appliedAt.present ? data.appliedAt.value : this.appliedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
      rejectionReason: data.rejectionReason.present
          ? data.rejectionReason.value
          : this.rejectionReason,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoanApplicationsTableData(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('groupId: $groupId, ')
          ..write('loanProductId: $loanProductId, ')
          ..write('loanProductName: $loanProductName, ')
          ..write('amountRequested: $amountRequested, ')
          ..write('term: $term, ')
          ..write('purpose: $purpose, ')
          ..write('status: $status, ')
          ..write('appliedById: $appliedById, ')
          ..write('appliedAt: $appliedAt, ')
          ..write('notes: $notes, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      clientId,
      groupId,
      loanProductId,
      loanProductName,
      amountRequested,
      term,
      purpose,
      status,
      appliedById,
      appliedAt,
      notes,
      rejectionReason,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoanApplicationsTableData &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.groupId == this.groupId &&
          other.loanProductId == this.loanProductId &&
          other.loanProductName == this.loanProductName &&
          other.amountRequested == this.amountRequested &&
          other.term == this.term &&
          other.purpose == this.purpose &&
          other.status == this.status &&
          other.appliedById == this.appliedById &&
          other.appliedAt == this.appliedAt &&
          other.notes == this.notes &&
          other.rejectionReason == this.rejectionReason &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class LoanApplicationsTableCompanion
    extends UpdateCompanion<LoanApplicationsTableData> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<String?> groupId;
  final Value<String> loanProductId;
  final Value<String> loanProductName;
  final Value<double> amountRequested;
  final Value<int> term;
  final Value<String> purpose;
  final Value<String> status;
  final Value<String> appliedById;
  final Value<String> appliedAt;
  final Value<String> notes;
  final Value<String> rejectionReason;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const LoanApplicationsTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.loanProductId = const Value.absent(),
    this.loanProductName = const Value.absent(),
    this.amountRequested = const Value.absent(),
    this.term = const Value.absent(),
    this.purpose = const Value.absent(),
    this.status = const Value.absent(),
    this.appliedById = const Value.absent(),
    this.appliedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoanApplicationsTableCompanion.insert({
    required String id,
    required String clientId,
    this.groupId = const Value.absent(),
    required String loanProductId,
    this.loanProductName = const Value.absent(),
    required double amountRequested,
    required int term,
    required String purpose,
    this.status = const Value.absent(),
    required String appliedById,
    required String appliedAt,
    this.notes = const Value.absent(),
    this.rejectionReason = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        clientId = Value(clientId),
        loanProductId = Value(loanProductId),
        amountRequested = Value(amountRequested),
        term = Value(term),
        purpose = Value(purpose),
        appliedById = Value(appliedById),
        appliedAt = Value(appliedAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<LoanApplicationsTableData> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? groupId,
    Expression<String>? loanProductId,
    Expression<String>? loanProductName,
    Expression<double>? amountRequested,
    Expression<int>? term,
    Expression<String>? purpose,
    Expression<String>? status,
    Expression<String>? appliedById,
    Expression<String>? appliedAt,
    Expression<String>? notes,
    Expression<String>? rejectionReason,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (groupId != null) 'group_id': groupId,
      if (loanProductId != null) 'loan_product_id': loanProductId,
      if (loanProductName != null) 'loan_product_name': loanProductName,
      if (amountRequested != null) 'amount_requested': amountRequested,
      if (term != null) 'term': term,
      if (purpose != null) 'purpose': purpose,
      if (status != null) 'status': status,
      if (appliedById != null) 'applied_by_id': appliedById,
      if (appliedAt != null) 'applied_at': appliedAt,
      if (notes != null) 'notes': notes,
      if (rejectionReason != null) 'rejection_reason': rejectionReason,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoanApplicationsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? clientId,
      Value<String?>? groupId,
      Value<String>? loanProductId,
      Value<String>? loanProductName,
      Value<double>? amountRequested,
      Value<int>? term,
      Value<String>? purpose,
      Value<String>? status,
      Value<String>? appliedById,
      Value<String>? appliedAt,
      Value<String>? notes,
      Value<String>? rejectionReason,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return LoanApplicationsTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      groupId: groupId ?? this.groupId,
      loanProductId: loanProductId ?? this.loanProductId,
      loanProductName: loanProductName ?? this.loanProductName,
      amountRequested: amountRequested ?? this.amountRequested,
      term: term ?? this.term,
      purpose: purpose ?? this.purpose,
      status: status ?? this.status,
      appliedById: appliedById ?? this.appliedById,
      appliedAt: appliedAt ?? this.appliedAt,
      notes: notes ?? this.notes,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (loanProductId.present) {
      map['loan_product_id'] = Variable<String>(loanProductId.value);
    }
    if (loanProductName.present) {
      map['loan_product_name'] = Variable<String>(loanProductName.value);
    }
    if (amountRequested.present) {
      map['amount_requested'] = Variable<double>(amountRequested.value);
    }
    if (term.present) {
      map['term'] = Variable<int>(term.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (appliedById.present) {
      map['applied_by_id'] = Variable<String>(appliedById.value);
    }
    if (appliedAt.present) {
      map['applied_at'] = Variable<String>(appliedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rejectionReason.present) {
      map['rejection_reason'] = Variable<String>(rejectionReason.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoanApplicationsTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('groupId: $groupId, ')
          ..write('loanProductId: $loanProductId, ')
          ..write('loanProductName: $loanProductName, ')
          ..write('amountRequested: $amountRequested, ')
          ..write('term: $term, ')
          ..write('purpose: $purpose, ')
          ..write('status: $status, ')
          ..write('appliedById: $appliedById, ')
          ..write('appliedAt: $appliedAt, ')
          ..write('notes: $notes, ')
          ..write('rejectionReason: $rejectionReason, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LoansTableTable extends LoansTable
    with TableInfo<$LoansTableTable, LoansTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoansTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _applicationIdMeta =
      const VerificationMeta('applicationId');
  @override
  late final GeneratedColumn<String> applicationId = GeneratedColumn<String>(
      'application_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanProductIdMeta =
      const VerificationMeta('loanProductId');
  @override
  late final GeneratedColumn<String> loanProductId = GeneratedColumn<String>(
      'loan_product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanNumberMeta =
      const VerificationMeta('loanNumber');
  @override
  late final GeneratedColumn<String> loanNumber = GeneratedColumn<String>(
      'loan_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _principalAmountMeta =
      const VerificationMeta('principalAmount');
  @override
  late final GeneratedColumn<double> principalAmount = GeneratedColumn<double>(
      'principal_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _interestAmountMeta =
      const VerificationMeta('interestAmount');
  @override
  late final GeneratedColumn<double> interestAmount = GeneratedColumn<double>(
      'interest_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalAmountMeta =
      const VerificationMeta('totalAmount');
  @override
  late final GeneratedColumn<double> totalAmount = GeneratedColumn<double>(
      'total_amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _amountPaidMeta =
      const VerificationMeta('amountPaid');
  @override
  late final GeneratedColumn<double> amountPaid = GeneratedColumn<double>(
      'amount_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _outstandingBalanceMeta =
      const VerificationMeta('outstandingBalance');
  @override
  late final GeneratedColumn<double> outstandingBalance =
      GeneratedColumn<double>('outstanding_balance', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _disbursementDateMeta =
      const VerificationMeta('disbursementDate');
  @override
  late final GeneratedColumn<String> disbursementDate = GeneratedColumn<String>(
      'disbursement_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _maturityDateMeta =
      const VerificationMeta('maturityDate');
  @override
  late final GeneratedColumn<String> maturityDate = GeneratedColumn<String>(
      'maturity_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        applicationId,
        clientId,
        loanProductId,
        loanNumber,
        principalAmount,
        interestAmount,
        totalAmount,
        amountPaid,
        outstandingBalance,
        disbursementDate,
        maturityDate,
        status,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loans';
  @override
  VerificationContext validateIntegrity(Insertable<LoansTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('application_id')) {
      context.handle(
          _applicationIdMeta,
          applicationId.isAcceptableOrUnknown(
              data['application_id']!, _applicationIdMeta));
    } else if (isInserting) {
      context.missing(_applicationIdMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('loan_product_id')) {
      context.handle(
          _loanProductIdMeta,
          loanProductId.isAcceptableOrUnknown(
              data['loan_product_id']!, _loanProductIdMeta));
    } else if (isInserting) {
      context.missing(_loanProductIdMeta);
    }
    if (data.containsKey('loan_number')) {
      context.handle(
          _loanNumberMeta,
          loanNumber.isAcceptableOrUnknown(
              data['loan_number']!, _loanNumberMeta));
    } else if (isInserting) {
      context.missing(_loanNumberMeta);
    }
    if (data.containsKey('principal_amount')) {
      context.handle(
          _principalAmountMeta,
          principalAmount.isAcceptableOrUnknown(
              data['principal_amount']!, _principalAmountMeta));
    } else if (isInserting) {
      context.missing(_principalAmountMeta);
    }
    if (data.containsKey('interest_amount')) {
      context.handle(
          _interestAmountMeta,
          interestAmount.isAcceptableOrUnknown(
              data['interest_amount']!, _interestAmountMeta));
    } else if (isInserting) {
      context.missing(_interestAmountMeta);
    }
    if (data.containsKey('total_amount')) {
      context.handle(
          _totalAmountMeta,
          totalAmount.isAcceptableOrUnknown(
              data['total_amount']!, _totalAmountMeta));
    } else if (isInserting) {
      context.missing(_totalAmountMeta);
    }
    if (data.containsKey('amount_paid')) {
      context.handle(
          _amountPaidMeta,
          amountPaid.isAcceptableOrUnknown(
              data['amount_paid']!, _amountPaidMeta));
    }
    if (data.containsKey('outstanding_balance')) {
      context.handle(
          _outstandingBalanceMeta,
          outstandingBalance.isAcceptableOrUnknown(
              data['outstanding_balance']!, _outstandingBalanceMeta));
    } else if (isInserting) {
      context.missing(_outstandingBalanceMeta);
    }
    if (data.containsKey('disbursement_date')) {
      context.handle(
          _disbursementDateMeta,
          disbursementDate.isAcceptableOrUnknown(
              data['disbursement_date']!, _disbursementDateMeta));
    } else if (isInserting) {
      context.missing(_disbursementDateMeta);
    }
    if (data.containsKey('maturity_date')) {
      context.handle(
          _maturityDateMeta,
          maturityDate.isAcceptableOrUnknown(
              data['maturity_date']!, _maturityDateMeta));
    } else if (isInserting) {
      context.missing(_maturityDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoansTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoansTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      applicationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}application_id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id'])!,
      loanProductId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}loan_product_id'])!,
      loanNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loan_number'])!,
      principalAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}principal_amount'])!,
      interestAmount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}interest_amount'])!,
      totalAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_amount'])!,
      amountPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount_paid'])!,
      outstandingBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}outstanding_balance'])!,
      disbursementDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}disbursement_date'])!,
      maturityDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}maturity_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $LoansTableTable createAlias(String alias) {
    return $LoansTableTable(attachedDatabase, alias);
  }
}

class LoansTableData extends DataClass implements Insertable<LoansTableData> {
  final String id;
  final String applicationId;
  final String clientId;
  final String loanProductId;
  final String loanNumber;
  final double principalAmount;
  final double interestAmount;
  final double totalAmount;
  final double amountPaid;
  final double outstandingBalance;
  final String disbursementDate;
  final String maturityDate;
  final String status;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const LoansTableData(
      {required this.id,
      required this.applicationId,
      required this.clientId,
      required this.loanProductId,
      required this.loanNumber,
      required this.principalAmount,
      required this.interestAmount,
      required this.totalAmount,
      required this.amountPaid,
      required this.outstandingBalance,
      required this.disbursementDate,
      required this.maturityDate,
      required this.status,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['application_id'] = Variable<String>(applicationId);
    map['client_id'] = Variable<String>(clientId);
    map['loan_product_id'] = Variable<String>(loanProductId);
    map['loan_number'] = Variable<String>(loanNumber);
    map['principal_amount'] = Variable<double>(principalAmount);
    map['interest_amount'] = Variable<double>(interestAmount);
    map['total_amount'] = Variable<double>(totalAmount);
    map['amount_paid'] = Variable<double>(amountPaid);
    map['outstanding_balance'] = Variable<double>(outstandingBalance);
    map['disbursement_date'] = Variable<String>(disbursementDate);
    map['maturity_date'] = Variable<String>(maturityDate);
    map['status'] = Variable<String>(status);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  LoansTableCompanion toCompanion(bool nullToAbsent) {
    return LoansTableCompanion(
      id: Value(id),
      applicationId: Value(applicationId),
      clientId: Value(clientId),
      loanProductId: Value(loanProductId),
      loanNumber: Value(loanNumber),
      principalAmount: Value(principalAmount),
      interestAmount: Value(interestAmount),
      totalAmount: Value(totalAmount),
      amountPaid: Value(amountPaid),
      outstandingBalance: Value(outstandingBalance),
      disbursementDate: Value(disbursementDate),
      maturityDate: Value(maturityDate),
      status: Value(status),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory LoansTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoansTableData(
      id: serializer.fromJson<String>(json['id']),
      applicationId: serializer.fromJson<String>(json['applicationId']),
      clientId: serializer.fromJson<String>(json['clientId']),
      loanProductId: serializer.fromJson<String>(json['loanProductId']),
      loanNumber: serializer.fromJson<String>(json['loanNumber']),
      principalAmount: serializer.fromJson<double>(json['principalAmount']),
      interestAmount: serializer.fromJson<double>(json['interestAmount']),
      totalAmount: serializer.fromJson<double>(json['totalAmount']),
      amountPaid: serializer.fromJson<double>(json['amountPaid']),
      outstandingBalance:
          serializer.fromJson<double>(json['outstandingBalance']),
      disbursementDate: serializer.fromJson<String>(json['disbursementDate']),
      maturityDate: serializer.fromJson<String>(json['maturityDate']),
      status: serializer.fromJson<String>(json['status']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'applicationId': serializer.toJson<String>(applicationId),
      'clientId': serializer.toJson<String>(clientId),
      'loanProductId': serializer.toJson<String>(loanProductId),
      'loanNumber': serializer.toJson<String>(loanNumber),
      'principalAmount': serializer.toJson<double>(principalAmount),
      'interestAmount': serializer.toJson<double>(interestAmount),
      'totalAmount': serializer.toJson<double>(totalAmount),
      'amountPaid': serializer.toJson<double>(amountPaid),
      'outstandingBalance': serializer.toJson<double>(outstandingBalance),
      'disbursementDate': serializer.toJson<String>(disbursementDate),
      'maturityDate': serializer.toJson<String>(maturityDate),
      'status': serializer.toJson<String>(status),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  LoansTableData copyWith(
          {String? id,
          String? applicationId,
          String? clientId,
          String? loanProductId,
          String? loanNumber,
          double? principalAmount,
          double? interestAmount,
          double? totalAmount,
          double? amountPaid,
          double? outstandingBalance,
          String? disbursementDate,
          String? maturityDate,
          String? status,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      LoansTableData(
        id: id ?? this.id,
        applicationId: applicationId ?? this.applicationId,
        clientId: clientId ?? this.clientId,
        loanProductId: loanProductId ?? this.loanProductId,
        loanNumber: loanNumber ?? this.loanNumber,
        principalAmount: principalAmount ?? this.principalAmount,
        interestAmount: interestAmount ?? this.interestAmount,
        totalAmount: totalAmount ?? this.totalAmount,
        amountPaid: amountPaid ?? this.amountPaid,
        outstandingBalance: outstandingBalance ?? this.outstandingBalance,
        disbursementDate: disbursementDate ?? this.disbursementDate,
        maturityDate: maturityDate ?? this.maturityDate,
        status: status ?? this.status,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  LoansTableData copyWithCompanion(LoansTableCompanion data) {
    return LoansTableData(
      id: data.id.present ? data.id.value : this.id,
      applicationId: data.applicationId.present
          ? data.applicationId.value
          : this.applicationId,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      loanProductId: data.loanProductId.present
          ? data.loanProductId.value
          : this.loanProductId,
      loanNumber:
          data.loanNumber.present ? data.loanNumber.value : this.loanNumber,
      principalAmount: data.principalAmount.present
          ? data.principalAmount.value
          : this.principalAmount,
      interestAmount: data.interestAmount.present
          ? data.interestAmount.value
          : this.interestAmount,
      totalAmount:
          data.totalAmount.present ? data.totalAmount.value : this.totalAmount,
      amountPaid:
          data.amountPaid.present ? data.amountPaid.value : this.amountPaid,
      outstandingBalance: data.outstandingBalance.present
          ? data.outstandingBalance.value
          : this.outstandingBalance,
      disbursementDate: data.disbursementDate.present
          ? data.disbursementDate.value
          : this.disbursementDate,
      maturityDate: data.maturityDate.present
          ? data.maturityDate.value
          : this.maturityDate,
      status: data.status.present ? data.status.value : this.status,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoansTableData(')
          ..write('id: $id, ')
          ..write('applicationId: $applicationId, ')
          ..write('clientId: $clientId, ')
          ..write('loanProductId: $loanProductId, ')
          ..write('loanNumber: $loanNumber, ')
          ..write('principalAmount: $principalAmount, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('outstandingBalance: $outstandingBalance, ')
          ..write('disbursementDate: $disbursementDate, ')
          ..write('maturityDate: $maturityDate, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      applicationId,
      clientId,
      loanProductId,
      loanNumber,
      principalAmount,
      interestAmount,
      totalAmount,
      amountPaid,
      outstandingBalance,
      disbursementDate,
      maturityDate,
      status,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoansTableData &&
          other.id == this.id &&
          other.applicationId == this.applicationId &&
          other.clientId == this.clientId &&
          other.loanProductId == this.loanProductId &&
          other.loanNumber == this.loanNumber &&
          other.principalAmount == this.principalAmount &&
          other.interestAmount == this.interestAmount &&
          other.totalAmount == this.totalAmount &&
          other.amountPaid == this.amountPaid &&
          other.outstandingBalance == this.outstandingBalance &&
          other.disbursementDate == this.disbursementDate &&
          other.maturityDate == this.maturityDate &&
          other.status == this.status &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class LoansTableCompanion extends UpdateCompanion<LoansTableData> {
  final Value<String> id;
  final Value<String> applicationId;
  final Value<String> clientId;
  final Value<String> loanProductId;
  final Value<String> loanNumber;
  final Value<double> principalAmount;
  final Value<double> interestAmount;
  final Value<double> totalAmount;
  final Value<double> amountPaid;
  final Value<double> outstandingBalance;
  final Value<String> disbursementDate;
  final Value<String> maturityDate;
  final Value<String> status;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const LoansTableCompanion({
    this.id = const Value.absent(),
    this.applicationId = const Value.absent(),
    this.clientId = const Value.absent(),
    this.loanProductId = const Value.absent(),
    this.loanNumber = const Value.absent(),
    this.principalAmount = const Value.absent(),
    this.interestAmount = const Value.absent(),
    this.totalAmount = const Value.absent(),
    this.amountPaid = const Value.absent(),
    this.outstandingBalance = const Value.absent(),
    this.disbursementDate = const Value.absent(),
    this.maturityDate = const Value.absent(),
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LoansTableCompanion.insert({
    required String id,
    required String applicationId,
    required String clientId,
    required String loanProductId,
    required String loanNumber,
    required double principalAmount,
    required double interestAmount,
    required double totalAmount,
    this.amountPaid = const Value.absent(),
    required double outstandingBalance,
    required String disbursementDate,
    required String maturityDate,
    this.status = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        applicationId = Value(applicationId),
        clientId = Value(clientId),
        loanProductId = Value(loanProductId),
        loanNumber = Value(loanNumber),
        principalAmount = Value(principalAmount),
        interestAmount = Value(interestAmount),
        totalAmount = Value(totalAmount),
        outstandingBalance = Value(outstandingBalance),
        disbursementDate = Value(disbursementDate),
        maturityDate = Value(maturityDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<LoansTableData> custom({
    Expression<String>? id,
    Expression<String>? applicationId,
    Expression<String>? clientId,
    Expression<String>? loanProductId,
    Expression<String>? loanNumber,
    Expression<double>? principalAmount,
    Expression<double>? interestAmount,
    Expression<double>? totalAmount,
    Expression<double>? amountPaid,
    Expression<double>? outstandingBalance,
    Expression<String>? disbursementDate,
    Expression<String>? maturityDate,
    Expression<String>? status,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (applicationId != null) 'application_id': applicationId,
      if (clientId != null) 'client_id': clientId,
      if (loanProductId != null) 'loan_product_id': loanProductId,
      if (loanNumber != null) 'loan_number': loanNumber,
      if (principalAmount != null) 'principal_amount': principalAmount,
      if (interestAmount != null) 'interest_amount': interestAmount,
      if (totalAmount != null) 'total_amount': totalAmount,
      if (amountPaid != null) 'amount_paid': amountPaid,
      if (outstandingBalance != null) 'outstanding_balance': outstandingBalance,
      if (disbursementDate != null) 'disbursement_date': disbursementDate,
      if (maturityDate != null) 'maturity_date': maturityDate,
      if (status != null) 'status': status,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LoansTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? applicationId,
      Value<String>? clientId,
      Value<String>? loanProductId,
      Value<String>? loanNumber,
      Value<double>? principalAmount,
      Value<double>? interestAmount,
      Value<double>? totalAmount,
      Value<double>? amountPaid,
      Value<double>? outstandingBalance,
      Value<String>? disbursementDate,
      Value<String>? maturityDate,
      Value<String>? status,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return LoansTableCompanion(
      id: id ?? this.id,
      applicationId: applicationId ?? this.applicationId,
      clientId: clientId ?? this.clientId,
      loanProductId: loanProductId ?? this.loanProductId,
      loanNumber: loanNumber ?? this.loanNumber,
      principalAmount: principalAmount ?? this.principalAmount,
      interestAmount: interestAmount ?? this.interestAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      amountPaid: amountPaid ?? this.amountPaid,
      outstandingBalance: outstandingBalance ?? this.outstandingBalance,
      disbursementDate: disbursementDate ?? this.disbursementDate,
      maturityDate: maturityDate ?? this.maturityDate,
      status: status ?? this.status,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (applicationId.present) {
      map['application_id'] = Variable<String>(applicationId.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (loanProductId.present) {
      map['loan_product_id'] = Variable<String>(loanProductId.value);
    }
    if (loanNumber.present) {
      map['loan_number'] = Variable<String>(loanNumber.value);
    }
    if (principalAmount.present) {
      map['principal_amount'] = Variable<double>(principalAmount.value);
    }
    if (interestAmount.present) {
      map['interest_amount'] = Variable<double>(interestAmount.value);
    }
    if (totalAmount.present) {
      map['total_amount'] = Variable<double>(totalAmount.value);
    }
    if (amountPaid.present) {
      map['amount_paid'] = Variable<double>(amountPaid.value);
    }
    if (outstandingBalance.present) {
      map['outstanding_balance'] = Variable<double>(outstandingBalance.value);
    }
    if (disbursementDate.present) {
      map['disbursement_date'] = Variable<String>(disbursementDate.value);
    }
    if (maturityDate.present) {
      map['maturity_date'] = Variable<String>(maturityDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoansTableCompanion(')
          ..write('id: $id, ')
          ..write('applicationId: $applicationId, ')
          ..write('clientId: $clientId, ')
          ..write('loanProductId: $loanProductId, ')
          ..write('loanNumber: $loanNumber, ')
          ..write('principalAmount: $principalAmount, ')
          ..write('interestAmount: $interestAmount, ')
          ..write('totalAmount: $totalAmount, ')
          ..write('amountPaid: $amountPaid, ')
          ..write('outstandingBalance: $outstandingBalance, ')
          ..write('disbursementDate: $disbursementDate, ')
          ..write('maturityDate: $maturityDate, ')
          ..write('status: $status, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RepaymentScheduleTableTable extends RepaymentScheduleTable
    with TableInfo<$RepaymentScheduleTableTable, RepaymentScheduleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepaymentScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanIdMeta = const VerificationMeta('loanId');
  @override
  late final GeneratedColumn<String> loanId = GeneratedColumn<String>(
      'loan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _installmentNumberMeta =
      const VerificationMeta('installmentNumber');
  @override
  late final GeneratedColumn<int> installmentNumber = GeneratedColumn<int>(
      'installment_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dueDateMeta =
      const VerificationMeta('dueDate');
  @override
  late final GeneratedColumn<String> dueDate = GeneratedColumn<String>(
      'due_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _principalDueMeta =
      const VerificationMeta('principalDue');
  @override
  late final GeneratedColumn<double> principalDue = GeneratedColumn<double>(
      'principal_due', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _interestDueMeta =
      const VerificationMeta('interestDue');
  @override
  late final GeneratedColumn<double> interestDue = GeneratedColumn<double>(
      'interest_due', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _totalDueMeta =
      const VerificationMeta('totalDue');
  @override
  late final GeneratedColumn<double> totalDue = GeneratedColumn<double>(
      'total_due', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _principalPaidMeta =
      const VerificationMeta('principalPaid');
  @override
  late final GeneratedColumn<double> principalPaid = GeneratedColumn<double>(
      'principal_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _interestPaidMeta =
      const VerificationMeta('interestPaid');
  @override
  late final GeneratedColumn<double> interestPaid = GeneratedColumn<double>(
      'interest_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _totalPaidMeta =
      const VerificationMeta('totalPaid');
  @override
  late final GeneratedColumn<double> totalPaid = GeneratedColumn<double>(
      'total_paid', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        loanId,
        installmentNumber,
        dueDate,
        principalDue,
        interestDue,
        totalDue,
        principalPaid,
        interestPaid,
        totalPaid,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repayment_schedule';
  @override
  VerificationContext validateIntegrity(
      Insertable<RepaymentScheduleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('loan_id')) {
      context.handle(_loanIdMeta,
          loanId.isAcceptableOrUnknown(data['loan_id']!, _loanIdMeta));
    } else if (isInserting) {
      context.missing(_loanIdMeta);
    }
    if (data.containsKey('installment_number')) {
      context.handle(
          _installmentNumberMeta,
          installmentNumber.isAcceptableOrUnknown(
              data['installment_number']!, _installmentNumberMeta));
    } else if (isInserting) {
      context.missing(_installmentNumberMeta);
    }
    if (data.containsKey('due_date')) {
      context.handle(_dueDateMeta,
          dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta));
    } else if (isInserting) {
      context.missing(_dueDateMeta);
    }
    if (data.containsKey('principal_due')) {
      context.handle(
          _principalDueMeta,
          principalDue.isAcceptableOrUnknown(
              data['principal_due']!, _principalDueMeta));
    } else if (isInserting) {
      context.missing(_principalDueMeta);
    }
    if (data.containsKey('interest_due')) {
      context.handle(
          _interestDueMeta,
          interestDue.isAcceptableOrUnknown(
              data['interest_due']!, _interestDueMeta));
    } else if (isInserting) {
      context.missing(_interestDueMeta);
    }
    if (data.containsKey('total_due')) {
      context.handle(_totalDueMeta,
          totalDue.isAcceptableOrUnknown(data['total_due']!, _totalDueMeta));
    } else if (isInserting) {
      context.missing(_totalDueMeta);
    }
    if (data.containsKey('principal_paid')) {
      context.handle(
          _principalPaidMeta,
          principalPaid.isAcceptableOrUnknown(
              data['principal_paid']!, _principalPaidMeta));
    }
    if (data.containsKey('interest_paid')) {
      context.handle(
          _interestPaidMeta,
          interestPaid.isAcceptableOrUnknown(
              data['interest_paid']!, _interestPaidMeta));
    }
    if (data.containsKey('total_paid')) {
      context.handle(_totalPaidMeta,
          totalPaid.isAcceptableOrUnknown(data['total_paid']!, _totalPaidMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RepaymentScheduleTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepaymentScheduleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      loanId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loan_id'])!,
      installmentNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}installment_number'])!,
      dueDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}due_date'])!,
      principalDue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}principal_due'])!,
      interestDue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interest_due'])!,
      totalDue: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_due'])!,
      principalPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}principal_paid'])!,
      interestPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}interest_paid'])!,
      totalPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_paid'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $RepaymentScheduleTableTable createAlias(String alias) {
    return $RepaymentScheduleTableTable(attachedDatabase, alias);
  }
}

class RepaymentScheduleTableData extends DataClass
    implements Insertable<RepaymentScheduleTableData> {
  final String id;
  final String loanId;
  final int installmentNumber;
  final String dueDate;
  final double principalDue;
  final double interestDue;
  final double totalDue;
  final double principalPaid;
  final double interestPaid;
  final double totalPaid;
  final String status;
  const RepaymentScheduleTableData(
      {required this.id,
      required this.loanId,
      required this.installmentNumber,
      required this.dueDate,
      required this.principalDue,
      required this.interestDue,
      required this.totalDue,
      required this.principalPaid,
      required this.interestPaid,
      required this.totalPaid,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['loan_id'] = Variable<String>(loanId);
    map['installment_number'] = Variable<int>(installmentNumber);
    map['due_date'] = Variable<String>(dueDate);
    map['principal_due'] = Variable<double>(principalDue);
    map['interest_due'] = Variable<double>(interestDue);
    map['total_due'] = Variable<double>(totalDue);
    map['principal_paid'] = Variable<double>(principalPaid);
    map['interest_paid'] = Variable<double>(interestPaid);
    map['total_paid'] = Variable<double>(totalPaid);
    map['status'] = Variable<String>(status);
    return map;
  }

  RepaymentScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return RepaymentScheduleTableCompanion(
      id: Value(id),
      loanId: Value(loanId),
      installmentNumber: Value(installmentNumber),
      dueDate: Value(dueDate),
      principalDue: Value(principalDue),
      interestDue: Value(interestDue),
      totalDue: Value(totalDue),
      principalPaid: Value(principalPaid),
      interestPaid: Value(interestPaid),
      totalPaid: Value(totalPaid),
      status: Value(status),
    );
  }

  factory RepaymentScheduleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepaymentScheduleTableData(
      id: serializer.fromJson<String>(json['id']),
      loanId: serializer.fromJson<String>(json['loanId']),
      installmentNumber: serializer.fromJson<int>(json['installmentNumber']),
      dueDate: serializer.fromJson<String>(json['dueDate']),
      principalDue: serializer.fromJson<double>(json['principalDue']),
      interestDue: serializer.fromJson<double>(json['interestDue']),
      totalDue: serializer.fromJson<double>(json['totalDue']),
      principalPaid: serializer.fromJson<double>(json['principalPaid']),
      interestPaid: serializer.fromJson<double>(json['interestPaid']),
      totalPaid: serializer.fromJson<double>(json['totalPaid']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loanId': serializer.toJson<String>(loanId),
      'installmentNumber': serializer.toJson<int>(installmentNumber),
      'dueDate': serializer.toJson<String>(dueDate),
      'principalDue': serializer.toJson<double>(principalDue),
      'interestDue': serializer.toJson<double>(interestDue),
      'totalDue': serializer.toJson<double>(totalDue),
      'principalPaid': serializer.toJson<double>(principalPaid),
      'interestPaid': serializer.toJson<double>(interestPaid),
      'totalPaid': serializer.toJson<double>(totalPaid),
      'status': serializer.toJson<String>(status),
    };
  }

  RepaymentScheduleTableData copyWith(
          {String? id,
          String? loanId,
          int? installmentNumber,
          String? dueDate,
          double? principalDue,
          double? interestDue,
          double? totalDue,
          double? principalPaid,
          double? interestPaid,
          double? totalPaid,
          String? status}) =>
      RepaymentScheduleTableData(
        id: id ?? this.id,
        loanId: loanId ?? this.loanId,
        installmentNumber: installmentNumber ?? this.installmentNumber,
        dueDate: dueDate ?? this.dueDate,
        principalDue: principalDue ?? this.principalDue,
        interestDue: interestDue ?? this.interestDue,
        totalDue: totalDue ?? this.totalDue,
        principalPaid: principalPaid ?? this.principalPaid,
        interestPaid: interestPaid ?? this.interestPaid,
        totalPaid: totalPaid ?? this.totalPaid,
        status: status ?? this.status,
      );
  RepaymentScheduleTableData copyWithCompanion(
      RepaymentScheduleTableCompanion data) {
    return RepaymentScheduleTableData(
      id: data.id.present ? data.id.value : this.id,
      loanId: data.loanId.present ? data.loanId.value : this.loanId,
      installmentNumber: data.installmentNumber.present
          ? data.installmentNumber.value
          : this.installmentNumber,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      principalDue: data.principalDue.present
          ? data.principalDue.value
          : this.principalDue,
      interestDue:
          data.interestDue.present ? data.interestDue.value : this.interestDue,
      totalDue: data.totalDue.present ? data.totalDue.value : this.totalDue,
      principalPaid: data.principalPaid.present
          ? data.principalPaid.value
          : this.principalPaid,
      interestPaid: data.interestPaid.present
          ? data.interestPaid.value
          : this.interestPaid,
      totalPaid: data.totalPaid.present ? data.totalPaid.value : this.totalPaid,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RepaymentScheduleTableData(')
          ..write('id: $id, ')
          ..write('loanId: $loanId, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('dueDate: $dueDate, ')
          ..write('principalDue: $principalDue, ')
          ..write('interestDue: $interestDue, ')
          ..write('totalDue: $totalDue, ')
          ..write('principalPaid: $principalPaid, ')
          ..write('interestPaid: $interestPaid, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      loanId,
      installmentNumber,
      dueDate,
      principalDue,
      interestDue,
      totalDue,
      principalPaid,
      interestPaid,
      totalPaid,
      status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepaymentScheduleTableData &&
          other.id == this.id &&
          other.loanId == this.loanId &&
          other.installmentNumber == this.installmentNumber &&
          other.dueDate == this.dueDate &&
          other.principalDue == this.principalDue &&
          other.interestDue == this.interestDue &&
          other.totalDue == this.totalDue &&
          other.principalPaid == this.principalPaid &&
          other.interestPaid == this.interestPaid &&
          other.totalPaid == this.totalPaid &&
          other.status == this.status);
}

class RepaymentScheduleTableCompanion
    extends UpdateCompanion<RepaymentScheduleTableData> {
  final Value<String> id;
  final Value<String> loanId;
  final Value<int> installmentNumber;
  final Value<String> dueDate;
  final Value<double> principalDue;
  final Value<double> interestDue;
  final Value<double> totalDue;
  final Value<double> principalPaid;
  final Value<double> interestPaid;
  final Value<double> totalPaid;
  final Value<String> status;
  final Value<int> rowid;
  const RepaymentScheduleTableCompanion({
    this.id = const Value.absent(),
    this.loanId = const Value.absent(),
    this.installmentNumber = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.principalDue = const Value.absent(),
    this.interestDue = const Value.absent(),
    this.totalDue = const Value.absent(),
    this.principalPaid = const Value.absent(),
    this.interestPaid = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RepaymentScheduleTableCompanion.insert({
    required String id,
    required String loanId,
    required int installmentNumber,
    required String dueDate,
    required double principalDue,
    required double interestDue,
    required double totalDue,
    this.principalPaid = const Value.absent(),
    this.interestPaid = const Value.absent(),
    this.totalPaid = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        loanId = Value(loanId),
        installmentNumber = Value(installmentNumber),
        dueDate = Value(dueDate),
        principalDue = Value(principalDue),
        interestDue = Value(interestDue),
        totalDue = Value(totalDue);
  static Insertable<RepaymentScheduleTableData> custom({
    Expression<String>? id,
    Expression<String>? loanId,
    Expression<int>? installmentNumber,
    Expression<String>? dueDate,
    Expression<double>? principalDue,
    Expression<double>? interestDue,
    Expression<double>? totalDue,
    Expression<double>? principalPaid,
    Expression<double>? interestPaid,
    Expression<double>? totalPaid,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loanId != null) 'loan_id': loanId,
      if (installmentNumber != null) 'installment_number': installmentNumber,
      if (dueDate != null) 'due_date': dueDate,
      if (principalDue != null) 'principal_due': principalDue,
      if (interestDue != null) 'interest_due': interestDue,
      if (totalDue != null) 'total_due': totalDue,
      if (principalPaid != null) 'principal_paid': principalPaid,
      if (interestPaid != null) 'interest_paid': interestPaid,
      if (totalPaid != null) 'total_paid': totalPaid,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RepaymentScheduleTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? loanId,
      Value<int>? installmentNumber,
      Value<String>? dueDate,
      Value<double>? principalDue,
      Value<double>? interestDue,
      Value<double>? totalDue,
      Value<double>? principalPaid,
      Value<double>? interestPaid,
      Value<double>? totalPaid,
      Value<String>? status,
      Value<int>? rowid}) {
    return RepaymentScheduleTableCompanion(
      id: id ?? this.id,
      loanId: loanId ?? this.loanId,
      installmentNumber: installmentNumber ?? this.installmentNumber,
      dueDate: dueDate ?? this.dueDate,
      principalDue: principalDue ?? this.principalDue,
      interestDue: interestDue ?? this.interestDue,
      totalDue: totalDue ?? this.totalDue,
      principalPaid: principalPaid ?? this.principalPaid,
      interestPaid: interestPaid ?? this.interestPaid,
      totalPaid: totalPaid ?? this.totalPaid,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loanId.present) {
      map['loan_id'] = Variable<String>(loanId.value);
    }
    if (installmentNumber.present) {
      map['installment_number'] = Variable<int>(installmentNumber.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<String>(dueDate.value);
    }
    if (principalDue.present) {
      map['principal_due'] = Variable<double>(principalDue.value);
    }
    if (interestDue.present) {
      map['interest_due'] = Variable<double>(interestDue.value);
    }
    if (totalDue.present) {
      map['total_due'] = Variable<double>(totalDue.value);
    }
    if (principalPaid.present) {
      map['principal_paid'] = Variable<double>(principalPaid.value);
    }
    if (interestPaid.present) {
      map['interest_paid'] = Variable<double>(interestPaid.value);
    }
    if (totalPaid.present) {
      map['total_paid'] = Variable<double>(totalPaid.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepaymentScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('loanId: $loanId, ')
          ..write('installmentNumber: $installmentNumber, ')
          ..write('dueDate: $dueDate, ')
          ..write('principalDue: $principalDue, ')
          ..write('interestDue: $interestDue, ')
          ..write('totalDue: $totalDue, ')
          ..write('principalPaid: $principalPaid, ')
          ..write('interestPaid: $interestPaid, ')
          ..write('totalPaid: $totalPaid, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RepaymentsTableTable extends RepaymentsTable
    with TableInfo<$RepaymentsTableTable, RepaymentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loanIdMeta = const VerificationMeta('loanId');
  @override
  late final GeneratedColumn<String> loanId = GeneratedColumn<String>(
      'loan_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _paymentDateMeta =
      const VerificationMeta('paymentDate');
  @override
  late final GeneratedColumn<String> paymentDate = GeneratedColumn<String>(
      'payment_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('cash'));
  static const VerificationMeta _referenceNumberMeta =
      const VerificationMeta('referenceNumber');
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
      'reference_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _receivedByIdMeta =
      const VerificationMeta('receivedById');
  @override
  late final GeneratedColumn<String> receivedById = GeneratedColumn<String>(
      'received_by_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        loanId,
        amount,
        paymentDate,
        paymentMethod,
        referenceNumber,
        receivedById,
        notes,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repayments';
  @override
  VerificationContext validateIntegrity(
      Insertable<RepaymentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('loan_id')) {
      context.handle(_loanIdMeta,
          loanId.isAcceptableOrUnknown(data['loan_id']!, _loanIdMeta));
    } else if (isInserting) {
      context.missing(_loanIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('payment_date')) {
      context.handle(
          _paymentDateMeta,
          paymentDate.isAcceptableOrUnknown(
              data['payment_date']!, _paymentDateMeta));
    } else if (isInserting) {
      context.missing(_paymentDateMeta);
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('reference_number')) {
      context.handle(
          _referenceNumberMeta,
          referenceNumber.isAcceptableOrUnknown(
              data['reference_number']!, _referenceNumberMeta));
    }
    if (data.containsKey('received_by_id')) {
      context.handle(
          _receivedByIdMeta,
          receivedById.isAcceptableOrUnknown(
              data['received_by_id']!, _receivedByIdMeta));
    } else if (isInserting) {
      context.missing(_receivedByIdMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RepaymentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepaymentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      loanId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}loan_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      paymentDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_date'])!,
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      referenceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reference_number'])!,
      receivedById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}received_by_id'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $RepaymentsTableTable createAlias(String alias) {
    return $RepaymentsTableTable(attachedDatabase, alias);
  }
}

class RepaymentsTableData extends DataClass
    implements Insertable<RepaymentsTableData> {
  final String id;
  final String loanId;
  final double amount;
  final String paymentDate;
  final String paymentMethod;
  final String referenceNumber;
  final String receivedById;
  final String notes;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const RepaymentsTableData(
      {required this.id,
      required this.loanId,
      required this.amount,
      required this.paymentDate,
      required this.paymentMethod,
      required this.referenceNumber,
      required this.receivedById,
      required this.notes,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['loan_id'] = Variable<String>(loanId);
    map['amount'] = Variable<double>(amount);
    map['payment_date'] = Variable<String>(paymentDate);
    map['payment_method'] = Variable<String>(paymentMethod);
    map['reference_number'] = Variable<String>(referenceNumber);
    map['received_by_id'] = Variable<String>(receivedById);
    map['notes'] = Variable<String>(notes);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  RepaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return RepaymentsTableCompanion(
      id: Value(id),
      loanId: Value(loanId),
      amount: Value(amount),
      paymentDate: Value(paymentDate),
      paymentMethod: Value(paymentMethod),
      referenceNumber: Value(referenceNumber),
      receivedById: Value(receivedById),
      notes: Value(notes),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory RepaymentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepaymentsTableData(
      id: serializer.fromJson<String>(json['id']),
      loanId: serializer.fromJson<String>(json['loanId']),
      amount: serializer.fromJson<double>(json['amount']),
      paymentDate: serializer.fromJson<String>(json['paymentDate']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      referenceNumber: serializer.fromJson<String>(json['referenceNumber']),
      receivedById: serializer.fromJson<String>(json['receivedById']),
      notes: serializer.fromJson<String>(json['notes']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'loanId': serializer.toJson<String>(loanId),
      'amount': serializer.toJson<double>(amount),
      'paymentDate': serializer.toJson<String>(paymentDate),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'referenceNumber': serializer.toJson<String>(referenceNumber),
      'receivedById': serializer.toJson<String>(receivedById),
      'notes': serializer.toJson<String>(notes),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  RepaymentsTableData copyWith(
          {String? id,
          String? loanId,
          double? amount,
          String? paymentDate,
          String? paymentMethod,
          String? referenceNumber,
          String? receivedById,
          String? notes,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      RepaymentsTableData(
        id: id ?? this.id,
        loanId: loanId ?? this.loanId,
        amount: amount ?? this.amount,
        paymentDate: paymentDate ?? this.paymentDate,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        referenceNumber: referenceNumber ?? this.referenceNumber,
        receivedById: receivedById ?? this.receivedById,
        notes: notes ?? this.notes,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  RepaymentsTableData copyWithCompanion(RepaymentsTableCompanion data) {
    return RepaymentsTableData(
      id: data.id.present ? data.id.value : this.id,
      loanId: data.loanId.present ? data.loanId.value : this.loanId,
      amount: data.amount.present ? data.amount.value : this.amount,
      paymentDate:
          data.paymentDate.present ? data.paymentDate.value : this.paymentDate,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      receivedById: data.receivedById.present
          ? data.receivedById.value
          : this.receivedById,
      notes: data.notes.present ? data.notes.value : this.notes,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RepaymentsTableData(')
          ..write('id: $id, ')
          ..write('loanId: $loanId, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('receivedById: $receivedById, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      loanId,
      amount,
      paymentDate,
      paymentMethod,
      referenceNumber,
      receivedById,
      notes,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepaymentsTableData &&
          other.id == this.id &&
          other.loanId == this.loanId &&
          other.amount == this.amount &&
          other.paymentDate == this.paymentDate &&
          other.paymentMethod == this.paymentMethod &&
          other.referenceNumber == this.referenceNumber &&
          other.receivedById == this.receivedById &&
          other.notes == this.notes &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class RepaymentsTableCompanion extends UpdateCompanion<RepaymentsTableData> {
  final Value<String> id;
  final Value<String> loanId;
  final Value<double> amount;
  final Value<String> paymentDate;
  final Value<String> paymentMethod;
  final Value<String> referenceNumber;
  final Value<String> receivedById;
  final Value<String> notes;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const RepaymentsTableCompanion({
    this.id = const Value.absent(),
    this.loanId = const Value.absent(),
    this.amount = const Value.absent(),
    this.paymentDate = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.receivedById = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RepaymentsTableCompanion.insert({
    required String id,
    required String loanId,
    required double amount,
    required String paymentDate,
    this.paymentMethod = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    required String receivedById,
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        loanId = Value(loanId),
        amount = Value(amount),
        paymentDate = Value(paymentDate),
        receivedById = Value(receivedById),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RepaymentsTableData> custom({
    Expression<String>? id,
    Expression<String>? loanId,
    Expression<double>? amount,
    Expression<String>? paymentDate,
    Expression<String>? paymentMethod,
    Expression<String>? referenceNumber,
    Expression<String>? receivedById,
    Expression<String>? notes,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (loanId != null) 'loan_id': loanId,
      if (amount != null) 'amount': amount,
      if (paymentDate != null) 'payment_date': paymentDate,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (receivedById != null) 'received_by_id': receivedById,
      if (notes != null) 'notes': notes,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RepaymentsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? loanId,
      Value<double>? amount,
      Value<String>? paymentDate,
      Value<String>? paymentMethod,
      Value<String>? referenceNumber,
      Value<String>? receivedById,
      Value<String>? notes,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return RepaymentsTableCompanion(
      id: id ?? this.id,
      loanId: loanId ?? this.loanId,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      receivedById: receivedById ?? this.receivedById,
      notes: notes ?? this.notes,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (loanId.present) {
      map['loan_id'] = Variable<String>(loanId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (paymentDate.present) {
      map['payment_date'] = Variable<String>(paymentDate.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (receivedById.present) {
      map['received_by_id'] = Variable<String>(receivedById.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('loanId: $loanId, ')
          ..write('amount: $amount, ')
          ..write('paymentDate: $paymentDate, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('receivedById: $receivedById, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavingsAccountsTableTable extends SavingsAccountsTable
    with TableInfo<$SavingsAccountsTableTable, SavingsAccountsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsAccountsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
      'client_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountNumberMeta =
      const VerificationMeta('accountNumber');
  @override
  late final GeneratedColumn<String> accountNumber = GeneratedColumn<String>(
      'account_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountTypeMeta =
      const VerificationMeta('accountType');
  @override
  late final GeneratedColumn<String> accountType = GeneratedColumn<String>(
      'account_type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('voluntary'));
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
      'balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _minimumBalanceMeta =
      const VerificationMeta('minimumBalance');
  @override
  late final GeneratedColumn<double> minimumBalance = GeneratedColumn<double>(
      'minimum_balance', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        clientId,
        accountNumber,
        accountType,
        balance,
        minimumBalance,
        isActive,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_accounts';
  @override
  VerificationContext validateIntegrity(
      Insertable<SavingsAccountsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('account_number')) {
      context.handle(
          _accountNumberMeta,
          accountNumber.isAcceptableOrUnknown(
              data['account_number']!, _accountNumberMeta));
    } else if (isInserting) {
      context.missing(_accountNumberMeta);
    }
    if (data.containsKey('account_type')) {
      context.handle(
          _accountTypeMeta,
          accountType.isAcceptableOrUnknown(
              data['account_type']!, _accountTypeMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    }
    if (data.containsKey('minimum_balance')) {
      context.handle(
          _minimumBalanceMeta,
          minimumBalance.isAcceptableOrUnknown(
              data['minimum_balance']!, _minimumBalanceMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsAccountsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsAccountsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_id'])!,
      accountNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_number'])!,
      accountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_type'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}balance'])!,
      minimumBalance: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}minimum_balance'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $SavingsAccountsTableTable createAlias(String alias) {
    return $SavingsAccountsTableTable(attachedDatabase, alias);
  }
}

class SavingsAccountsTableData extends DataClass
    implements Insertable<SavingsAccountsTableData> {
  final String id;
  final String clientId;
  final String accountNumber;
  final String accountType;
  final double balance;
  final double minimumBalance;
  final bool isActive;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const SavingsAccountsTableData(
      {required this.id,
      required this.clientId,
      required this.accountNumber,
      required this.accountType,
      required this.balance,
      required this.minimumBalance,
      required this.isActive,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['client_id'] = Variable<String>(clientId);
    map['account_number'] = Variable<String>(accountNumber);
    map['account_type'] = Variable<String>(accountType);
    map['balance'] = Variable<double>(balance);
    map['minimum_balance'] = Variable<double>(minimumBalance);
    map['is_active'] = Variable<bool>(isActive);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  SavingsAccountsTableCompanion toCompanion(bool nullToAbsent) {
    return SavingsAccountsTableCompanion(
      id: Value(id),
      clientId: Value(clientId),
      accountNumber: Value(accountNumber),
      accountType: Value(accountType),
      balance: Value(balance),
      minimumBalance: Value(minimumBalance),
      isActive: Value(isActive),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory SavingsAccountsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsAccountsTableData(
      id: serializer.fromJson<String>(json['id']),
      clientId: serializer.fromJson<String>(json['clientId']),
      accountNumber: serializer.fromJson<String>(json['accountNumber']),
      accountType: serializer.fromJson<String>(json['accountType']),
      balance: serializer.fromJson<double>(json['balance']),
      minimumBalance: serializer.fromJson<double>(json['minimumBalance']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'clientId': serializer.toJson<String>(clientId),
      'accountNumber': serializer.toJson<String>(accountNumber),
      'accountType': serializer.toJson<String>(accountType),
      'balance': serializer.toJson<double>(balance),
      'minimumBalance': serializer.toJson<double>(minimumBalance),
      'isActive': serializer.toJson<bool>(isActive),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  SavingsAccountsTableData copyWith(
          {String? id,
          String? clientId,
          String? accountNumber,
          String? accountType,
          double? balance,
          double? minimumBalance,
          bool? isActive,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      SavingsAccountsTableData(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        accountNumber: accountNumber ?? this.accountNumber,
        accountType: accountType ?? this.accountType,
        balance: balance ?? this.balance,
        minimumBalance: minimumBalance ?? this.minimumBalance,
        isActive: isActive ?? this.isActive,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  SavingsAccountsTableData copyWithCompanion(
      SavingsAccountsTableCompanion data) {
    return SavingsAccountsTableData(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      accountNumber: data.accountNumber.present
          ? data.accountNumber.value
          : this.accountNumber,
      accountType:
          data.accountType.present ? data.accountType.value : this.accountType,
      balance: data.balance.present ? data.balance.value : this.balance,
      minimumBalance: data.minimumBalance.present
          ? data.minimumBalance.value
          : this.minimumBalance,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsAccountsTableData(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountType: $accountType, ')
          ..write('balance: $balance, ')
          ..write('minimumBalance: $minimumBalance, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      clientId,
      accountNumber,
      accountType,
      balance,
      minimumBalance,
      isActive,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsAccountsTableData &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.accountNumber == this.accountNumber &&
          other.accountType == this.accountType &&
          other.balance == this.balance &&
          other.minimumBalance == this.minimumBalance &&
          other.isActive == this.isActive &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class SavingsAccountsTableCompanion
    extends UpdateCompanion<SavingsAccountsTableData> {
  final Value<String> id;
  final Value<String> clientId;
  final Value<String> accountNumber;
  final Value<String> accountType;
  final Value<double> balance;
  final Value<double> minimumBalance;
  final Value<bool> isActive;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const SavingsAccountsTableCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.accountNumber = const Value.absent(),
    this.accountType = const Value.absent(),
    this.balance = const Value.absent(),
    this.minimumBalance = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavingsAccountsTableCompanion.insert({
    required String id,
    required String clientId,
    required String accountNumber,
    this.accountType = const Value.absent(),
    this.balance = const Value.absent(),
    this.minimumBalance = const Value.absent(),
    this.isActive = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        clientId = Value(clientId),
        accountNumber = Value(accountNumber),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SavingsAccountsTableData> custom({
    Expression<String>? id,
    Expression<String>? clientId,
    Expression<String>? accountNumber,
    Expression<String>? accountType,
    Expression<double>? balance,
    Expression<double>? minimumBalance,
    Expression<bool>? isActive,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (accountNumber != null) 'account_number': accountNumber,
      if (accountType != null) 'account_type': accountType,
      if (balance != null) 'balance': balance,
      if (minimumBalance != null) 'minimum_balance': minimumBalance,
      if (isActive != null) 'is_active': isActive,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavingsAccountsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? clientId,
      Value<String>? accountNumber,
      Value<String>? accountType,
      Value<double>? balance,
      Value<double>? minimumBalance,
      Value<bool>? isActive,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return SavingsAccountsTableCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      accountNumber: accountNumber ?? this.accountNumber,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
      minimumBalance: minimumBalance ?? this.minimumBalance,
      isActive: isActive ?? this.isActive,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (accountNumber.present) {
      map['account_number'] = Variable<String>(accountNumber.value);
    }
    if (accountType.present) {
      map['account_type'] = Variable<String>(accountType.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (minimumBalance.present) {
      map['minimum_balance'] = Variable<double>(minimumBalance.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsAccountsTableCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('accountNumber: $accountNumber, ')
          ..write('accountType: $accountType, ')
          ..write('balance: $balance, ')
          ..write('minimumBalance: $minimumBalance, ')
          ..write('isActive: $isActive, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SavingsTransactionsTableTable extends SavingsTransactionsTable
    with
        TableInfo<$SavingsTransactionsTableTable,
            SavingsTransactionsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavingsTransactionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _savingsAccountIdMeta =
      const VerificationMeta('savingsAccountId');
  @override
  late final GeneratedColumn<String> savingsAccountId = GeneratedColumn<String>(
      'savings_account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
      'transaction_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _balanceAfterMeta =
      const VerificationMeta('balanceAfter');
  @override
  late final GeneratedColumn<double> balanceAfter = GeneratedColumn<double>(
      'balance_after', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<String> transactionDate = GeneratedColumn<String>(
      'transaction_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _performedByIdMeta =
      const VerificationMeta('performedById');
  @override
  late final GeneratedColumn<String> performedById = GeneratedColumn<String>(
      'performed_by_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _referenceNumberMeta =
      const VerificationMeta('referenceNumber');
  @override
  late final GeneratedColumn<String> referenceNumber = GeneratedColumn<String>(
      'reference_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        savingsAccountId,
        transactionType,
        amount,
        balanceAfter,
        transactionDate,
        performedById,
        referenceNumber,
        notes,
        syncStatus,
        createdAt,
        updatedAt,
        version,
        isDeleted
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'savings_transactions';
  @override
  VerificationContext validateIntegrity(
      Insertable<SavingsTransactionsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('savings_account_id')) {
      context.handle(
          _savingsAccountIdMeta,
          savingsAccountId.isAcceptableOrUnknown(
              data['savings_account_id']!, _savingsAccountIdMeta));
    } else if (isInserting) {
      context.missing(_savingsAccountIdMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
          _transactionTypeMeta,
          transactionType.isAcceptableOrUnknown(
              data['transaction_type']!, _transactionTypeMeta));
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('balance_after')) {
      context.handle(
          _balanceAfterMeta,
          balanceAfter.isAcceptableOrUnknown(
              data['balance_after']!, _balanceAfterMeta));
    } else if (isInserting) {
      context.missing(_balanceAfterMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('performed_by_id')) {
      context.handle(
          _performedByIdMeta,
          performedById.isAcceptableOrUnknown(
              data['performed_by_id']!, _performedByIdMeta));
    } else if (isInserting) {
      context.missing(_performedByIdMeta);
    }
    if (data.containsKey('reference_number')) {
      context.handle(
          _referenceNumberMeta,
          referenceNumber.isAcceptableOrUnknown(
              data['reference_number']!, _referenceNumberMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SavingsTransactionsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavingsTransactionsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      savingsAccountId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}savings_account_id'])!,
      transactionType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      balanceAfter: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}balance_after'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transaction_date'])!,
      performedById: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}performed_by_id'])!,
      referenceNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}reference_number'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
    );
  }

  @override
  $SavingsTransactionsTableTable createAlias(String alias) {
    return $SavingsTransactionsTableTable(attachedDatabase, alias);
  }
}

class SavingsTransactionsTableData extends DataClass
    implements Insertable<SavingsTransactionsTableData> {
  final String id;
  final String savingsAccountId;
  final String transactionType;
  final double amount;
  final double balanceAfter;
  final String transactionDate;
  final String performedById;
  final String referenceNumber;
  final String notes;
  final String syncStatus;
  final String createdAt;
  final String updatedAt;
  final int version;
  final bool isDeleted;
  const SavingsTransactionsTableData(
      {required this.id,
      required this.savingsAccountId,
      required this.transactionType,
      required this.amount,
      required this.balanceAfter,
      required this.transactionDate,
      required this.performedById,
      required this.referenceNumber,
      required this.notes,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      required this.version,
      required this.isDeleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['savings_account_id'] = Variable<String>(savingsAccountId);
    map['transaction_type'] = Variable<String>(transactionType);
    map['amount'] = Variable<double>(amount);
    map['balance_after'] = Variable<double>(balanceAfter);
    map['transaction_date'] = Variable<String>(transactionDate);
    map['performed_by_id'] = Variable<String>(performedById);
    map['reference_number'] = Variable<String>(referenceNumber);
    map['notes'] = Variable<String>(notes);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['version'] = Variable<int>(version);
    map['is_deleted'] = Variable<bool>(isDeleted);
    return map;
  }

  SavingsTransactionsTableCompanion toCompanion(bool nullToAbsent) {
    return SavingsTransactionsTableCompanion(
      id: Value(id),
      savingsAccountId: Value(savingsAccountId),
      transactionType: Value(transactionType),
      amount: Value(amount),
      balanceAfter: Value(balanceAfter),
      transactionDate: Value(transactionDate),
      performedById: Value(performedById),
      referenceNumber: Value(referenceNumber),
      notes: Value(notes),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      version: Value(version),
      isDeleted: Value(isDeleted),
    );
  }

  factory SavingsTransactionsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavingsTransactionsTableData(
      id: serializer.fromJson<String>(json['id']),
      savingsAccountId: serializer.fromJson<String>(json['savingsAccountId']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      amount: serializer.fromJson<double>(json['amount']),
      balanceAfter: serializer.fromJson<double>(json['balanceAfter']),
      transactionDate: serializer.fromJson<String>(json['transactionDate']),
      performedById: serializer.fromJson<String>(json['performedById']),
      referenceNumber: serializer.fromJson<String>(json['referenceNumber']),
      notes: serializer.fromJson<String>(json['notes']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      version: serializer.fromJson<int>(json['version']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'savingsAccountId': serializer.toJson<String>(savingsAccountId),
      'transactionType': serializer.toJson<String>(transactionType),
      'amount': serializer.toJson<double>(amount),
      'balanceAfter': serializer.toJson<double>(balanceAfter),
      'transactionDate': serializer.toJson<String>(transactionDate),
      'performedById': serializer.toJson<String>(performedById),
      'referenceNumber': serializer.toJson<String>(referenceNumber),
      'notes': serializer.toJson<String>(notes),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'version': serializer.toJson<int>(version),
      'isDeleted': serializer.toJson<bool>(isDeleted),
    };
  }

  SavingsTransactionsTableData copyWith(
          {String? id,
          String? savingsAccountId,
          String? transactionType,
          double? amount,
          double? balanceAfter,
          String? transactionDate,
          String? performedById,
          String? referenceNumber,
          String? notes,
          String? syncStatus,
          String? createdAt,
          String? updatedAt,
          int? version,
          bool? isDeleted}) =>
      SavingsTransactionsTableData(
        id: id ?? this.id,
        savingsAccountId: savingsAccountId ?? this.savingsAccountId,
        transactionType: transactionType ?? this.transactionType,
        amount: amount ?? this.amount,
        balanceAfter: balanceAfter ?? this.balanceAfter,
        transactionDate: transactionDate ?? this.transactionDate,
        performedById: performedById ?? this.performedById,
        referenceNumber: referenceNumber ?? this.referenceNumber,
        notes: notes ?? this.notes,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        version: version ?? this.version,
        isDeleted: isDeleted ?? this.isDeleted,
      );
  SavingsTransactionsTableData copyWithCompanion(
      SavingsTransactionsTableCompanion data) {
    return SavingsTransactionsTableData(
      id: data.id.present ? data.id.value : this.id,
      savingsAccountId: data.savingsAccountId.present
          ? data.savingsAccountId.value
          : this.savingsAccountId,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      amount: data.amount.present ? data.amount.value : this.amount,
      balanceAfter: data.balanceAfter.present
          ? data.balanceAfter.value
          : this.balanceAfter,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      performedById: data.performedById.present
          ? data.performedById.value
          : this.performedById,
      referenceNumber: data.referenceNumber.present
          ? data.referenceNumber.value
          : this.referenceNumber,
      notes: data.notes.present ? data.notes.value : this.notes,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      version: data.version.present ? data.version.value : this.version,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavingsTransactionsTableData(')
          ..write('id: $id, ')
          ..write('savingsAccountId: $savingsAccountId, ')
          ..write('transactionType: $transactionType, ')
          ..write('amount: $amount, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('performedById: $performedById, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      savingsAccountId,
      transactionType,
      amount,
      balanceAfter,
      transactionDate,
      performedById,
      referenceNumber,
      notes,
      syncStatus,
      createdAt,
      updatedAt,
      version,
      isDeleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavingsTransactionsTableData &&
          other.id == this.id &&
          other.savingsAccountId == this.savingsAccountId &&
          other.transactionType == this.transactionType &&
          other.amount == this.amount &&
          other.balanceAfter == this.balanceAfter &&
          other.transactionDate == this.transactionDate &&
          other.performedById == this.performedById &&
          other.referenceNumber == this.referenceNumber &&
          other.notes == this.notes &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.version == this.version &&
          other.isDeleted == this.isDeleted);
}

class SavingsTransactionsTableCompanion
    extends UpdateCompanion<SavingsTransactionsTableData> {
  final Value<String> id;
  final Value<String> savingsAccountId;
  final Value<String> transactionType;
  final Value<double> amount;
  final Value<double> balanceAfter;
  final Value<String> transactionDate;
  final Value<String> performedById;
  final Value<String> referenceNumber;
  final Value<String> notes;
  final Value<String> syncStatus;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> version;
  final Value<bool> isDeleted;
  final Value<int> rowid;
  const SavingsTransactionsTableCompanion({
    this.id = const Value.absent(),
    this.savingsAccountId = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.amount = const Value.absent(),
    this.balanceAfter = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.performedById = const Value.absent(),
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavingsTransactionsTableCompanion.insert({
    required String id,
    required String savingsAccountId,
    required String transactionType,
    required double amount,
    required double balanceAfter,
    required String transactionDate,
    required String performedById,
    this.referenceNumber = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.version = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        savingsAccountId = Value(savingsAccountId),
        transactionType = Value(transactionType),
        amount = Value(amount),
        balanceAfter = Value(balanceAfter),
        transactionDate = Value(transactionDate),
        performedById = Value(performedById),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SavingsTransactionsTableData> custom({
    Expression<String>? id,
    Expression<String>? savingsAccountId,
    Expression<String>? transactionType,
    Expression<double>? amount,
    Expression<double>? balanceAfter,
    Expression<String>? transactionDate,
    Expression<String>? performedById,
    Expression<String>? referenceNumber,
    Expression<String>? notes,
    Expression<String>? syncStatus,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? version,
    Expression<bool>? isDeleted,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (savingsAccountId != null) 'savings_account_id': savingsAccountId,
      if (transactionType != null) 'transaction_type': transactionType,
      if (amount != null) 'amount': amount,
      if (balanceAfter != null) 'balance_after': balanceAfter,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (performedById != null) 'performed_by_id': performedById,
      if (referenceNumber != null) 'reference_number': referenceNumber,
      if (notes != null) 'notes': notes,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (version != null) 'version': version,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavingsTransactionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? savingsAccountId,
      Value<String>? transactionType,
      Value<double>? amount,
      Value<double>? balanceAfter,
      Value<String>? transactionDate,
      Value<String>? performedById,
      Value<String>? referenceNumber,
      Value<String>? notes,
      Value<String>? syncStatus,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? version,
      Value<bool>? isDeleted,
      Value<int>? rowid}) {
    return SavingsTransactionsTableCompanion(
      id: id ?? this.id,
      savingsAccountId: savingsAccountId ?? this.savingsAccountId,
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      balanceAfter: balanceAfter ?? this.balanceAfter,
      transactionDate: transactionDate ?? this.transactionDate,
      performedById: performedById ?? this.performedById,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      notes: notes ?? this.notes,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      version: version ?? this.version,
      isDeleted: isDeleted ?? this.isDeleted,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (savingsAccountId.present) {
      map['savings_account_id'] = Variable<String>(savingsAccountId.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (balanceAfter.present) {
      map['balance_after'] = Variable<double>(balanceAfter.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<String>(transactionDate.value);
    }
    if (performedById.present) {
      map['performed_by_id'] = Variable<String>(performedById.value);
    }
    if (referenceNumber.present) {
      map['reference_number'] = Variable<String>(referenceNumber.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavingsTransactionsTableCompanion(')
          ..write('id: $id, ')
          ..write('savingsAccountId: $savingsAccountId, ')
          ..write('transactionType: $transactionType, ')
          ..write('amount: $amount, ')
          ..write('balanceAfter: $balanceAfter, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('performedById: $performedById, ')
          ..write('referenceNumber: $referenceNumber, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('version: $version, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTableTable extends SyncQueueTable
    with TableInfo<$SyncQueueTableTable, SyncQueueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entityType,
        entityId,
        operation,
        payload,
        status,
        retryCount,
        lastError,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SyncQueueTableTable createAlias(String alias) {
    return $SyncQueueTableTable(attachedDatabase, alias);
  }
}

class SyncQueueTableData extends DataClass
    implements Insertable<SyncQueueTableData> {
  final int id;
  final String entityType;
  final String entityId;
  final String operation;
  final String payload;
  final String status;
  final int retryCount;
  final String? lastError;
  final String createdAt;
  const SyncQueueTableData(
      {required this.id,
      required this.entityType,
      required this.entityId,
      required this.operation,
      required this.payload,
      required this.status,
      required this.retryCount,
      this.lastError,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<String>(entityId);
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  SyncQueueTableCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueTableCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
      operation: Value(operation),
      payload: Value(payload),
      status: Value(status),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
      createdAt: Value(createdAt),
    );
  }

  factory SyncQueueTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueTableData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<String>(json['entityId']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<String>(entityId),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  SyncQueueTableData copyWith(
          {int? id,
          String? entityType,
          String? entityId,
          String? operation,
          String? payload,
          String? status,
          int? retryCount,
          Value<String?> lastError = const Value.absent(),
          String? createdAt}) =>
      SyncQueueTableData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityId: entityId ?? this.entityId,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        status: status ?? this.status,
        retryCount: retryCount ?? this.retryCount,
        lastError: lastError.present ? lastError.value : this.lastError,
        createdAt: createdAt ?? this.createdAt,
      );
  SyncQueueTableData copyWithCompanion(SyncQueueTableCompanion data) {
    return SyncQueueTableData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      status: data.status.present ? data.status.value : this.status,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityType, entityId, operation, payload,
      status, retryCount, lastError, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueTableData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError &&
          other.createdAt == this.createdAt);
}

class SyncQueueTableCompanion extends UpdateCompanion<SyncQueueTableData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityId;
  final Value<String> operation;
  final Value<String> payload;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<String?> lastError;
  final Value<String> createdAt;
  const SyncQueueTableCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SyncQueueTableCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityId,
    required String operation,
    required String payload,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
    required String createdAt,
  })  : entityType = Value(entityType),
        entityId = Value(entityId),
        operation = Value(operation),
        payload = Value(payload),
        createdAt = Value(createdAt);
  static Insertable<SyncQueueTableData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityId,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<String>? lastError,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SyncQueueTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? entityId,
      Value<String>? operation,
      Value<String>? payload,
      Value<String>? status,
      Value<int>? retryCount,
      Value<String?>? lastError,
      Value<String>? createdAt}) {
    return SyncQueueTableCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $CachedUsersTableTable extends CachedUsersTable
    with TableInfo<$CachedUsersTableTable, CachedUsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _branchIdMeta =
      const VerificationMeta('branchId');
  @override
  late final GeneratedColumn<String> branchId = GeneratedColumn<String>(
      'branch_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _branchNameMeta =
      const VerificationMeta('branchName');
  @override
  late final GeneratedColumn<String> branchName = GeneratedColumn<String>(
      'branch_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        email,
        firstName,
        lastName,
        role,
        branchId,
        branchName,
        phoneNumber
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_users';
  @override
  VerificationContext validateIntegrity(
      Insertable<CachedUsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('branch_id')) {
      context.handle(_branchIdMeta,
          branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta));
    }
    if (data.containsKey('branch_name')) {
      context.handle(
          _branchNameMeta,
          branchName.isAcceptableOrUnknown(
              data['branch_name']!, _branchNameMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedUsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedUsersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      branchId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_id']),
      branchName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}branch_name']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number'])!,
    );
  }

  @override
  $CachedUsersTableTable createAlias(String alias) {
    return $CachedUsersTableTable(attachedDatabase, alias);
  }
}

class CachedUsersTableData extends DataClass
    implements Insertable<CachedUsersTableData> {
  final String id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String? branchId;
  final String? branchName;
  final String phoneNumber;
  const CachedUsersTableData(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.role,
      this.branchId,
      this.branchName,
      required this.phoneNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || branchId != null) {
      map['branch_id'] = Variable<String>(branchId);
    }
    if (!nullToAbsent || branchName != null) {
      map['branch_name'] = Variable<String>(branchName);
    }
    map['phone_number'] = Variable<String>(phoneNumber);
    return map;
  }

  CachedUsersTableCompanion toCompanion(bool nullToAbsent) {
    return CachedUsersTableCompanion(
      id: Value(id),
      username: Value(username),
      email: Value(email),
      firstName: Value(firstName),
      lastName: Value(lastName),
      role: Value(role),
      branchId: branchId == null && nullToAbsent
          ? const Value.absent()
          : Value(branchId),
      branchName: branchName == null && nullToAbsent
          ? const Value.absent()
          : Value(branchName),
      phoneNumber: Value(phoneNumber),
    );
  }

  factory CachedUsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUsersTableData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      role: serializer.fromJson<String>(json['role']),
      branchId: serializer.fromJson<String?>(json['branchId']),
      branchName: serializer.fromJson<String?>(json['branchName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'role': serializer.toJson<String>(role),
      'branchId': serializer.toJson<String?>(branchId),
      'branchName': serializer.toJson<String?>(branchName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
    };
  }

  CachedUsersTableData copyWith(
          {String? id,
          String? username,
          String? email,
          String? firstName,
          String? lastName,
          String? role,
          Value<String?> branchId = const Value.absent(),
          Value<String?> branchName = const Value.absent(),
          String? phoneNumber}) =>
      CachedUsersTableData(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
        branchId: branchId.present ? branchId.value : this.branchId,
        branchName: branchName.present ? branchName.value : this.branchName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
  CachedUsersTableData copyWithCompanion(CachedUsersTableCompanion data) {
    return CachedUsersTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      role: data.role.present ? data.role.value : this.role,
      branchId: data.branchId.present ? data.branchId.value : this.branchId,
      branchName:
          data.branchName.present ? data.branchName.value : this.branchName,
      phoneNumber:
          data.phoneNumber.present ? data.phoneNumber.value : this.phoneNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('role: $role, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('phoneNumber: $phoneNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, email, firstName, lastName,
      role, branchId, branchName, phoneNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUsersTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.role == this.role &&
          other.branchId == this.branchId &&
          other.branchName == this.branchName &&
          other.phoneNumber == this.phoneNumber);
}

class CachedUsersTableCompanion extends UpdateCompanion<CachedUsersTableData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> role;
  final Value<String?> branchId;
  final Value<String?> branchName;
  final Value<String> phoneNumber;
  final Value<int> rowid;
  const CachedUsersTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.role = const Value.absent(),
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedUsersTableCompanion.insert({
    required String id,
    required String username,
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    required String role,
    this.branchId = const Value.absent(),
    this.branchName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        username = Value(username),
        role = Value(role);
  static Insertable<CachedUsersTableData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? role,
    Expression<String>? branchId,
    Expression<String>? branchName,
    Expression<String>? phoneNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (role != null) 'role': role,
      if (branchId != null) 'branch_id': branchId,
      if (branchName != null) 'branch_name': branchName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedUsersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String>? email,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? role,
      Value<String?>? branchId,
      Value<String?>? branchName,
      Value<String>? phoneNumber,
      Value<int>? rowid}) {
    return CachedUsersTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<String>(branchId.value);
    }
    if (branchName.present) {
      map['branch_name'] = Variable<String>(branchName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUsersTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('role: $role, ')
          ..write('branchId: $branchId, ')
          ..write('branchName: $branchName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ClientsTableTable clientsTable = $ClientsTableTable(this);
  late final $GroupsTableTable groupsTable = $GroupsTableTable(this);
  late final $GroupMembershipsTableTable groupMembershipsTable =
      $GroupMembershipsTableTable(this);
  late final $LoanProductsTableTable loanProductsTable =
      $LoanProductsTableTable(this);
  late final $LoanApplicationsTableTable loanApplicationsTable =
      $LoanApplicationsTableTable(this);
  late final $LoansTableTable loansTable = $LoansTableTable(this);
  late final $RepaymentScheduleTableTable repaymentScheduleTable =
      $RepaymentScheduleTableTable(this);
  late final $RepaymentsTableTable repaymentsTable =
      $RepaymentsTableTable(this);
  late final $SavingsAccountsTableTable savingsAccountsTable =
      $SavingsAccountsTableTable(this);
  late final $SavingsTransactionsTableTable savingsTransactionsTable =
      $SavingsTransactionsTableTable(this);
  late final $SyncQueueTableTable syncQueueTable = $SyncQueueTableTable(this);
  late final $CachedUsersTableTable cachedUsersTable =
      $CachedUsersTableTable(this);
  late final ClientsDao clientsDao = ClientsDao(this as AppDatabase);
  late final GroupsDao groupsDao = GroupsDao(this as AppDatabase);
  late final LoansDao loansDao = LoansDao(this as AppDatabase);
  late final SavingsDao savingsDao = SavingsDao(this as AppDatabase);
  late final SyncQueueDao syncQueueDao = SyncQueueDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        clientsTable,
        groupsTable,
        groupMembershipsTable,
        loanProductsTable,
        loanApplicationsTable,
        loansTable,
        repaymentScheduleTable,
        repaymentsTable,
        savingsAccountsTable,
        savingsTransactionsTable,
        syncQueueTable,
        cachedUsersTable
      ];
}

typedef $$ClientsTableTableCreateCompanionBuilder = ClientsTableCompanion
    Function({
  required String id,
  required String nationalId,
  required String phoneNumber,
  required String firstName,
  required String lastName,
  required String dateOfBirth,
  required String gender,
  required String address,
  Value<String?> photoPath,
  Value<String> nextOfKinName,
  Value<String> nextOfKinPhone,
  required String branchId,
  required String createdById,
  Value<bool> isActive,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$ClientsTableTableUpdateCompanionBuilder = ClientsTableCompanion
    Function({
  Value<String> id,
  Value<String> nationalId,
  Value<String> phoneNumber,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> dateOfBirth,
  Value<String> gender,
  Value<String> address,
  Value<String?> photoPath,
  Value<String> nextOfKinName,
  Value<String> nextOfKinPhone,
  Value<String> branchId,
  Value<String> createdById,
  Value<bool> isActive,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$ClientsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextOfKinName => $composableBuilder(
      column: $table.nextOfKinName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nextOfKinPhone => $composableBuilder(
      column: $table.nextOfKinPhone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$ClientsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextOfKinName => $composableBuilder(
      column: $table.nextOfKinName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nextOfKinPhone => $composableBuilder(
      column: $table.nextOfKinPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$ClientsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTableTable> {
  $$ClientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nationalId => $composableBuilder(
      column: $table.nationalId, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get nextOfKinName => $composableBuilder(
      column: $table.nextOfKinName, builder: (column) => column);

  GeneratedColumn<String> get nextOfKinPhone => $composableBuilder(
      column: $table.nextOfKinPhone, builder: (column) => column);

  GeneratedColumn<String> get branchId =>
      $composableBuilder(column: $table.branchId, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$ClientsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClientsTableTable,
    ClientsTableData,
    $$ClientsTableTableFilterComposer,
    $$ClientsTableTableOrderingComposer,
    $$ClientsTableTableAnnotationComposer,
    $$ClientsTableTableCreateCompanionBuilder,
    $$ClientsTableTableUpdateCompanionBuilder,
    (
      ClientsTableData,
      BaseReferences<_$AppDatabase, $ClientsTableTable, ClientsTableData>
    ),
    ClientsTableData,
    PrefetchHooks Function()> {
  $$ClientsTableTableTableManager(_$AppDatabase db, $ClientsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> nationalId = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> dateOfBirth = const Value.absent(),
            Value<String> gender = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<String> nextOfKinName = const Value.absent(),
            Value<String> nextOfKinPhone = const Value.absent(),
            Value<String> branchId = const Value.absent(),
            Value<String> createdById = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClientsTableCompanion(
            id: id,
            nationalId: nationalId,
            phoneNumber: phoneNumber,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            gender: gender,
            address: address,
            photoPath: photoPath,
            nextOfKinName: nextOfKinName,
            nextOfKinPhone: nextOfKinPhone,
            branchId: branchId,
            createdById: createdById,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String nationalId,
            required String phoneNumber,
            required String firstName,
            required String lastName,
            required String dateOfBirth,
            required String gender,
            required String address,
            Value<String?> photoPath = const Value.absent(),
            Value<String> nextOfKinName = const Value.absent(),
            Value<String> nextOfKinPhone = const Value.absent(),
            required String branchId,
            required String createdById,
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ClientsTableCompanion.insert(
            id: id,
            nationalId: nationalId,
            phoneNumber: phoneNumber,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth,
            gender: gender,
            address: address,
            photoPath: photoPath,
            nextOfKinName: nextOfKinName,
            nextOfKinPhone: nextOfKinPhone,
            branchId: branchId,
            createdById: createdById,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClientsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClientsTableTable,
    ClientsTableData,
    $$ClientsTableTableFilterComposer,
    $$ClientsTableTableOrderingComposer,
    $$ClientsTableTableAnnotationComposer,
    $$ClientsTableTableCreateCompanionBuilder,
    $$ClientsTableTableUpdateCompanionBuilder,
    (
      ClientsTableData,
      BaseReferences<_$AppDatabase, $ClientsTableTable, ClientsTableData>
    ),
    ClientsTableData,
    PrefetchHooks Function()>;
typedef $$GroupsTableTableCreateCompanionBuilder = GroupsTableCompanion
    Function({
  required String id,
  required String name,
  required String groupType,
  required String branchId,
  required String loanOfficerId,
  Value<String> meetingDay,
  Value<String> meetingFrequency,
  Value<String> meetingLocation,
  Value<bool> isActive,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$GroupsTableTableUpdateCompanionBuilder = GroupsTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> groupType,
  Value<String> branchId,
  Value<String> loanOfficerId,
  Value<String> meetingDay,
  Value<String> meetingFrequency,
  Value<String> meetingLocation,
  Value<bool> isActive,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$GroupsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GroupsTableTable> {
  $$GroupsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupType => $composableBuilder(
      column: $table.groupType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanOfficerId => $composableBuilder(
      column: $table.loanOfficerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetingDay => $composableBuilder(
      column: $table.meetingDay, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetingFrequency => $composableBuilder(
      column: $table.meetingFrequency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get meetingLocation => $composableBuilder(
      column: $table.meetingLocation,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$GroupsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupsTableTable> {
  $$GroupsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupType => $composableBuilder(
      column: $table.groupType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanOfficerId => $composableBuilder(
      column: $table.loanOfficerId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetingDay => $composableBuilder(
      column: $table.meetingDay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetingFrequency => $composableBuilder(
      column: $table.meetingFrequency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get meetingLocation => $composableBuilder(
      column: $table.meetingLocation,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$GroupsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupsTableTable> {
  $$GroupsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get groupType =>
      $composableBuilder(column: $table.groupType, builder: (column) => column);

  GeneratedColumn<String> get branchId =>
      $composableBuilder(column: $table.branchId, builder: (column) => column);

  GeneratedColumn<String> get loanOfficerId => $composableBuilder(
      column: $table.loanOfficerId, builder: (column) => column);

  GeneratedColumn<String> get meetingDay => $composableBuilder(
      column: $table.meetingDay, builder: (column) => column);

  GeneratedColumn<String> get meetingFrequency => $composableBuilder(
      column: $table.meetingFrequency, builder: (column) => column);

  GeneratedColumn<String> get meetingLocation => $composableBuilder(
      column: $table.meetingLocation, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$GroupsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupsTableTable,
    GroupsTableData,
    $$GroupsTableTableFilterComposer,
    $$GroupsTableTableOrderingComposer,
    $$GroupsTableTableAnnotationComposer,
    $$GroupsTableTableCreateCompanionBuilder,
    $$GroupsTableTableUpdateCompanionBuilder,
    (
      GroupsTableData,
      BaseReferences<_$AppDatabase, $GroupsTableTable, GroupsTableData>
    ),
    GroupsTableData,
    PrefetchHooks Function()> {
  $$GroupsTableTableTableManager(_$AppDatabase db, $GroupsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> groupType = const Value.absent(),
            Value<String> branchId = const Value.absent(),
            Value<String> loanOfficerId = const Value.absent(),
            Value<String> meetingDay = const Value.absent(),
            Value<String> meetingFrequency = const Value.absent(),
            Value<String> meetingLocation = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsTableCompanion(
            id: id,
            name: name,
            groupType: groupType,
            branchId: branchId,
            loanOfficerId: loanOfficerId,
            meetingDay: meetingDay,
            meetingFrequency: meetingFrequency,
            meetingLocation: meetingLocation,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String groupType,
            required String branchId,
            required String loanOfficerId,
            Value<String> meetingDay = const Value.absent(),
            Value<String> meetingFrequency = const Value.absent(),
            Value<String> meetingLocation = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupsTableCompanion.insert(
            id: id,
            name: name,
            groupType: groupType,
            branchId: branchId,
            loanOfficerId: loanOfficerId,
            meetingDay: meetingDay,
            meetingFrequency: meetingFrequency,
            meetingLocation: meetingLocation,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GroupsTableTable,
    GroupsTableData,
    $$GroupsTableTableFilterComposer,
    $$GroupsTableTableOrderingComposer,
    $$GroupsTableTableAnnotationComposer,
    $$GroupsTableTableCreateCompanionBuilder,
    $$GroupsTableTableUpdateCompanionBuilder,
    (
      GroupsTableData,
      BaseReferences<_$AppDatabase, $GroupsTableTable, GroupsTableData>
    ),
    GroupsTableData,
    PrefetchHooks Function()>;
typedef $$GroupMembershipsTableTableCreateCompanionBuilder
    = GroupMembershipsTableCompanion Function({
  required String id,
  required String groupId,
  required String clientId,
  Value<String> role,
  required String joinedAt,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$GroupMembershipsTableTableUpdateCompanionBuilder
    = GroupMembershipsTableCompanion Function({
  Value<String> id,
  Value<String> groupId,
  Value<String> clientId,
  Value<String> role,
  Value<String> joinedAt,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$GroupMembershipsTableTableFilterComposer
    extends Composer<_$AppDatabase, $GroupMembershipsTableTable> {
  $$GroupMembershipsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get joinedAt => $composableBuilder(
      column: $table.joinedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$GroupMembershipsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupMembershipsTableTable> {
  $$GroupMembershipsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get joinedAt => $composableBuilder(
      column: $table.joinedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$GroupMembershipsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupMembershipsTableTable> {
  $$GroupMembershipsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get joinedAt =>
      $composableBuilder(column: $table.joinedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$GroupMembershipsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GroupMembershipsTableTable,
    GroupMembershipsTableData,
    $$GroupMembershipsTableTableFilterComposer,
    $$GroupMembershipsTableTableOrderingComposer,
    $$GroupMembershipsTableTableAnnotationComposer,
    $$GroupMembershipsTableTableCreateCompanionBuilder,
    $$GroupMembershipsTableTableUpdateCompanionBuilder,
    (
      GroupMembershipsTableData,
      BaseReferences<_$AppDatabase, $GroupMembershipsTableTable,
          GroupMembershipsTableData>
    ),
    GroupMembershipsTableData,
    PrefetchHooks Function()> {
  $$GroupMembershipsTableTableTableManager(
      _$AppDatabase db, $GroupMembershipsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupMembershipsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupMembershipsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupMembershipsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<String> clientId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> joinedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupMembershipsTableCompanion(
            id: id,
            groupId: groupId,
            clientId: clientId,
            role: role,
            joinedAt: joinedAt,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String groupId,
            required String clientId,
            Value<String> role = const Value.absent(),
            required String joinedAt,
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GroupMembershipsTableCompanion.insert(
            id: id,
            groupId: groupId,
            clientId: clientId,
            role: role,
            joinedAt: joinedAt,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$GroupMembershipsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $GroupMembershipsTableTable,
        GroupMembershipsTableData,
        $$GroupMembershipsTableTableFilterComposer,
        $$GroupMembershipsTableTableOrderingComposer,
        $$GroupMembershipsTableTableAnnotationComposer,
        $$GroupMembershipsTableTableCreateCompanionBuilder,
        $$GroupMembershipsTableTableUpdateCompanionBuilder,
        (
          GroupMembershipsTableData,
          BaseReferences<_$AppDatabase, $GroupMembershipsTableTable,
              GroupMembershipsTableData>
        ),
        GroupMembershipsTableData,
        PrefetchHooks Function()>;
typedef $$LoanProductsTableTableCreateCompanionBuilder
    = LoanProductsTableCompanion Function({
  required String id,
  required String name,
  Value<String> description,
  required double minAmount,
  required double maxAmount,
  required double interestRate,
  required String interestType,
  required String repaymentFrequency,
  required int minTerm,
  required int maxTerm,
  Value<double> processingFeeRate,
  Value<bool> isActive,
  Value<String?> syncedAt,
  Value<int> rowid,
});
typedef $$LoanProductsTableTableUpdateCompanionBuilder
    = LoanProductsTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<double> minAmount,
  Value<double> maxAmount,
  Value<double> interestRate,
  Value<String> interestType,
  Value<String> repaymentFrequency,
  Value<int> minTerm,
  Value<int> maxTerm,
  Value<double> processingFeeRate,
  Value<bool> isActive,
  Value<String?> syncedAt,
  Value<int> rowid,
});

class $$LoanProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LoanProductsTableTable> {
  $$LoanProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minAmount => $composableBuilder(
      column: $table.minAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get maxAmount => $composableBuilder(
      column: $table.maxAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestRate => $composableBuilder(
      column: $table.interestRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get interestType => $composableBuilder(
      column: $table.interestType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get repaymentFrequency => $composableBuilder(
      column: $table.repaymentFrequency,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minTerm => $composableBuilder(
      column: $table.minTerm, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxTerm => $composableBuilder(
      column: $table.maxTerm, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get processingFeeRate => $composableBuilder(
      column: $table.processingFeeRate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnFilters(column));
}

class $$LoanProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LoanProductsTableTable> {
  $$LoanProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minAmount => $composableBuilder(
      column: $table.minAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get maxAmount => $composableBuilder(
      column: $table.maxAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestRate => $composableBuilder(
      column: $table.interestRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get interestType => $composableBuilder(
      column: $table.interestType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get repaymentFrequency => $composableBuilder(
      column: $table.repaymentFrequency,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minTerm => $composableBuilder(
      column: $table.minTerm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxTerm => $composableBuilder(
      column: $table.maxTerm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get processingFeeRate => $composableBuilder(
      column: $table.processingFeeRate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnOrderings(column));
}

class $$LoanProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoanProductsTableTable> {
  $$LoanProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<double> get minAmount =>
      $composableBuilder(column: $table.minAmount, builder: (column) => column);

  GeneratedColumn<double> get maxAmount =>
      $composableBuilder(column: $table.maxAmount, builder: (column) => column);

  GeneratedColumn<double> get interestRate => $composableBuilder(
      column: $table.interestRate, builder: (column) => column);

  GeneratedColumn<String> get interestType => $composableBuilder(
      column: $table.interestType, builder: (column) => column);

  GeneratedColumn<String> get repaymentFrequency => $composableBuilder(
      column: $table.repaymentFrequency, builder: (column) => column);

  GeneratedColumn<int> get minTerm =>
      $composableBuilder(column: $table.minTerm, builder: (column) => column);

  GeneratedColumn<int> get maxTerm =>
      $composableBuilder(column: $table.maxTerm, builder: (column) => column);

  GeneratedColumn<double> get processingFeeRate => $composableBuilder(
      column: $table.processingFeeRate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$LoanProductsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoanProductsTableTable,
    LoanProductsTableData,
    $$LoanProductsTableTableFilterComposer,
    $$LoanProductsTableTableOrderingComposer,
    $$LoanProductsTableTableAnnotationComposer,
    $$LoanProductsTableTableCreateCompanionBuilder,
    $$LoanProductsTableTableUpdateCompanionBuilder,
    (
      LoanProductsTableData,
      BaseReferences<_$AppDatabase, $LoanProductsTableTable,
          LoanProductsTableData>
    ),
    LoanProductsTableData,
    PrefetchHooks Function()> {
  $$LoanProductsTableTableTableManager(
      _$AppDatabase db, $LoanProductsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoanProductsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoanProductsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoanProductsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<double> minAmount = const Value.absent(),
            Value<double> maxAmount = const Value.absent(),
            Value<double> interestRate = const Value.absent(),
            Value<String> interestType = const Value.absent(),
            Value<String> repaymentFrequency = const Value.absent(),
            Value<int> minTerm = const Value.absent(),
            Value<int> maxTerm = const Value.absent(),
            Value<double> processingFeeRate = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> syncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoanProductsTableCompanion(
            id: id,
            name: name,
            description: description,
            minAmount: minAmount,
            maxAmount: maxAmount,
            interestRate: interestRate,
            interestType: interestType,
            repaymentFrequency: repaymentFrequency,
            minTerm: minTerm,
            maxTerm: maxTerm,
            processingFeeRate: processingFeeRate,
            isActive: isActive,
            syncedAt: syncedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String> description = const Value.absent(),
            required double minAmount,
            required double maxAmount,
            required double interestRate,
            required String interestType,
            required String repaymentFrequency,
            required int minTerm,
            required int maxTerm,
            Value<double> processingFeeRate = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> syncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoanProductsTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            minAmount: minAmount,
            maxAmount: maxAmount,
            interestRate: interestRate,
            interestType: interestType,
            repaymentFrequency: repaymentFrequency,
            minTerm: minTerm,
            maxTerm: maxTerm,
            processingFeeRate: processingFeeRate,
            isActive: isActive,
            syncedAt: syncedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoanProductsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoanProductsTableTable,
    LoanProductsTableData,
    $$LoanProductsTableTableFilterComposer,
    $$LoanProductsTableTableOrderingComposer,
    $$LoanProductsTableTableAnnotationComposer,
    $$LoanProductsTableTableCreateCompanionBuilder,
    $$LoanProductsTableTableUpdateCompanionBuilder,
    (
      LoanProductsTableData,
      BaseReferences<_$AppDatabase, $LoanProductsTableTable,
          LoanProductsTableData>
    ),
    LoanProductsTableData,
    PrefetchHooks Function()>;
typedef $$LoanApplicationsTableTableCreateCompanionBuilder
    = LoanApplicationsTableCompanion Function({
  required String id,
  required String clientId,
  Value<String?> groupId,
  required String loanProductId,
  Value<String> loanProductName,
  required double amountRequested,
  required int term,
  required String purpose,
  Value<String> status,
  required String appliedById,
  required String appliedAt,
  Value<String> notes,
  Value<String> rejectionReason,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$LoanApplicationsTableTableUpdateCompanionBuilder
    = LoanApplicationsTableCompanion Function({
  Value<String> id,
  Value<String> clientId,
  Value<String?> groupId,
  Value<String> loanProductId,
  Value<String> loanProductName,
  Value<double> amountRequested,
  Value<int> term,
  Value<String> purpose,
  Value<String> status,
  Value<String> appliedById,
  Value<String> appliedAt,
  Value<String> notes,
  Value<String> rejectionReason,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$LoanApplicationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $LoanApplicationsTableTable> {
  $$LoanApplicationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanProductName => $composableBuilder(
      column: $table.loanProductName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountRequested => $composableBuilder(
      column: $table.amountRequested,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get term => $composableBuilder(
      column: $table.term, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get purpose => $composableBuilder(
      column: $table.purpose, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appliedById => $composableBuilder(
      column: $table.appliedById, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get appliedAt => $composableBuilder(
      column: $table.appliedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$LoanApplicationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LoanApplicationsTableTable> {
  $$LoanApplicationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanProductName => $composableBuilder(
      column: $table.loanProductName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountRequested => $composableBuilder(
      column: $table.amountRequested,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get term => $composableBuilder(
      column: $table.term, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purpose => $composableBuilder(
      column: $table.purpose, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appliedById => $composableBuilder(
      column: $table.appliedById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get appliedAt => $composableBuilder(
      column: $table.appliedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$LoanApplicationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoanApplicationsTableTable> {
  $$LoanApplicationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId, builder: (column) => column);

  GeneratedColumn<String> get loanProductName => $composableBuilder(
      column: $table.loanProductName, builder: (column) => column);

  GeneratedColumn<double> get amountRequested => $composableBuilder(
      column: $table.amountRequested, builder: (column) => column);

  GeneratedColumn<int> get term =>
      $composableBuilder(column: $table.term, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get appliedById => $composableBuilder(
      column: $table.appliedById, builder: (column) => column);

  GeneratedColumn<String> get appliedAt =>
      $composableBuilder(column: $table.appliedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get rejectionReason => $composableBuilder(
      column: $table.rejectionReason, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$LoanApplicationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoanApplicationsTableTable,
    LoanApplicationsTableData,
    $$LoanApplicationsTableTableFilterComposer,
    $$LoanApplicationsTableTableOrderingComposer,
    $$LoanApplicationsTableTableAnnotationComposer,
    $$LoanApplicationsTableTableCreateCompanionBuilder,
    $$LoanApplicationsTableTableUpdateCompanionBuilder,
    (
      LoanApplicationsTableData,
      BaseReferences<_$AppDatabase, $LoanApplicationsTableTable,
          LoanApplicationsTableData>
    ),
    LoanApplicationsTableData,
    PrefetchHooks Function()> {
  $$LoanApplicationsTableTableTableManager(
      _$AppDatabase db, $LoanApplicationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoanApplicationsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$LoanApplicationsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoanApplicationsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> clientId = const Value.absent(),
            Value<String?> groupId = const Value.absent(),
            Value<String> loanProductId = const Value.absent(),
            Value<String> loanProductName = const Value.absent(),
            Value<double> amountRequested = const Value.absent(),
            Value<int> term = const Value.absent(),
            Value<String> purpose = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> appliedById = const Value.absent(),
            Value<String> appliedAt = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<String> rejectionReason = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoanApplicationsTableCompanion(
            id: id,
            clientId: clientId,
            groupId: groupId,
            loanProductId: loanProductId,
            loanProductName: loanProductName,
            amountRequested: amountRequested,
            term: term,
            purpose: purpose,
            status: status,
            appliedById: appliedById,
            appliedAt: appliedAt,
            notes: notes,
            rejectionReason: rejectionReason,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String clientId,
            Value<String?> groupId = const Value.absent(),
            required String loanProductId,
            Value<String> loanProductName = const Value.absent(),
            required double amountRequested,
            required int term,
            required String purpose,
            Value<String> status = const Value.absent(),
            required String appliedById,
            required String appliedAt,
            Value<String> notes = const Value.absent(),
            Value<String> rejectionReason = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoanApplicationsTableCompanion.insert(
            id: id,
            clientId: clientId,
            groupId: groupId,
            loanProductId: loanProductId,
            loanProductName: loanProductName,
            amountRequested: amountRequested,
            term: term,
            purpose: purpose,
            status: status,
            appliedById: appliedById,
            appliedAt: appliedAt,
            notes: notes,
            rejectionReason: rejectionReason,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoanApplicationsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $LoanApplicationsTableTable,
        LoanApplicationsTableData,
        $$LoanApplicationsTableTableFilterComposer,
        $$LoanApplicationsTableTableOrderingComposer,
        $$LoanApplicationsTableTableAnnotationComposer,
        $$LoanApplicationsTableTableCreateCompanionBuilder,
        $$LoanApplicationsTableTableUpdateCompanionBuilder,
        (
          LoanApplicationsTableData,
          BaseReferences<_$AppDatabase, $LoanApplicationsTableTable,
              LoanApplicationsTableData>
        ),
        LoanApplicationsTableData,
        PrefetchHooks Function()>;
typedef $$LoansTableTableCreateCompanionBuilder = LoansTableCompanion Function({
  required String id,
  required String applicationId,
  required String clientId,
  required String loanProductId,
  required String loanNumber,
  required double principalAmount,
  required double interestAmount,
  required double totalAmount,
  Value<double> amountPaid,
  required double outstandingBalance,
  required String disbursementDate,
  required String maturityDate,
  Value<String> status,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$LoansTableTableUpdateCompanionBuilder = LoansTableCompanion Function({
  Value<String> id,
  Value<String> applicationId,
  Value<String> clientId,
  Value<String> loanProductId,
  Value<String> loanNumber,
  Value<double> principalAmount,
  Value<double> interestAmount,
  Value<double> totalAmount,
  Value<double> amountPaid,
  Value<double> outstandingBalance,
  Value<String> disbursementDate,
  Value<String> maturityDate,
  Value<String> status,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$LoansTableTableFilterComposer
    extends Composer<_$AppDatabase, $LoansTableTable> {
  $$LoansTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get applicationId => $composableBuilder(
      column: $table.applicationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanNumber => $composableBuilder(
      column: $table.loanNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get principalAmount => $composableBuilder(
      column: $table.principalAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get disbursementDate => $composableBuilder(
      column: $table.disbursementDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$LoansTableTableOrderingComposer
    extends Composer<_$AppDatabase, $LoansTableTable> {
  $$LoansTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get applicationId => $composableBuilder(
      column: $table.applicationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanNumber => $composableBuilder(
      column: $table.loanNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get principalAmount => $composableBuilder(
      column: $table.principalAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get disbursementDate => $composableBuilder(
      column: $table.disbursementDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get maturityDate => $composableBuilder(
      column: $table.maturityDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$LoansTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $LoansTableTable> {
  $$LoansTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get applicationId => $composableBuilder(
      column: $table.applicationId, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get loanProductId => $composableBuilder(
      column: $table.loanProductId, builder: (column) => column);

  GeneratedColumn<String> get loanNumber => $composableBuilder(
      column: $table.loanNumber, builder: (column) => column);

  GeneratedColumn<double> get principalAmount => $composableBuilder(
      column: $table.principalAmount, builder: (column) => column);

  GeneratedColumn<double> get interestAmount => $composableBuilder(
      column: $table.interestAmount, builder: (column) => column);

  GeneratedColumn<double> get totalAmount => $composableBuilder(
      column: $table.totalAmount, builder: (column) => column);

  GeneratedColumn<double> get amountPaid => $composableBuilder(
      column: $table.amountPaid, builder: (column) => column);

  GeneratedColumn<double> get outstandingBalance => $composableBuilder(
      column: $table.outstandingBalance, builder: (column) => column);

  GeneratedColumn<String> get disbursementDate => $composableBuilder(
      column: $table.disbursementDate, builder: (column) => column);

  GeneratedColumn<String> get maturityDate => $composableBuilder(
      column: $table.maturityDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$LoansTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LoansTableTable,
    LoansTableData,
    $$LoansTableTableFilterComposer,
    $$LoansTableTableOrderingComposer,
    $$LoansTableTableAnnotationComposer,
    $$LoansTableTableCreateCompanionBuilder,
    $$LoansTableTableUpdateCompanionBuilder,
    (
      LoansTableData,
      BaseReferences<_$AppDatabase, $LoansTableTable, LoansTableData>
    ),
    LoansTableData,
    PrefetchHooks Function()> {
  $$LoansTableTableTableManager(_$AppDatabase db, $LoansTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoansTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoansTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoansTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> applicationId = const Value.absent(),
            Value<String> clientId = const Value.absent(),
            Value<String> loanProductId = const Value.absent(),
            Value<String> loanNumber = const Value.absent(),
            Value<double> principalAmount = const Value.absent(),
            Value<double> interestAmount = const Value.absent(),
            Value<double> totalAmount = const Value.absent(),
            Value<double> amountPaid = const Value.absent(),
            Value<double> outstandingBalance = const Value.absent(),
            Value<String> disbursementDate = const Value.absent(),
            Value<String> maturityDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoansTableCompanion(
            id: id,
            applicationId: applicationId,
            clientId: clientId,
            loanProductId: loanProductId,
            loanNumber: loanNumber,
            principalAmount: principalAmount,
            interestAmount: interestAmount,
            totalAmount: totalAmount,
            amountPaid: amountPaid,
            outstandingBalance: outstandingBalance,
            disbursementDate: disbursementDate,
            maturityDate: maturityDate,
            status: status,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String applicationId,
            required String clientId,
            required String loanProductId,
            required String loanNumber,
            required double principalAmount,
            required double interestAmount,
            required double totalAmount,
            Value<double> amountPaid = const Value.absent(),
            required double outstandingBalance,
            required String disbursementDate,
            required String maturityDate,
            Value<String> status = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LoansTableCompanion.insert(
            id: id,
            applicationId: applicationId,
            clientId: clientId,
            loanProductId: loanProductId,
            loanNumber: loanNumber,
            principalAmount: principalAmount,
            interestAmount: interestAmount,
            totalAmount: totalAmount,
            amountPaid: amountPaid,
            outstandingBalance: outstandingBalance,
            disbursementDate: disbursementDate,
            maturityDate: maturityDate,
            status: status,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LoansTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LoansTableTable,
    LoansTableData,
    $$LoansTableTableFilterComposer,
    $$LoansTableTableOrderingComposer,
    $$LoansTableTableAnnotationComposer,
    $$LoansTableTableCreateCompanionBuilder,
    $$LoansTableTableUpdateCompanionBuilder,
    (
      LoansTableData,
      BaseReferences<_$AppDatabase, $LoansTableTable, LoansTableData>
    ),
    LoansTableData,
    PrefetchHooks Function()>;
typedef $$RepaymentScheduleTableTableCreateCompanionBuilder
    = RepaymentScheduleTableCompanion Function({
  required String id,
  required String loanId,
  required int installmentNumber,
  required String dueDate,
  required double principalDue,
  required double interestDue,
  required double totalDue,
  Value<double> principalPaid,
  Value<double> interestPaid,
  Value<double> totalPaid,
  Value<String> status,
  Value<int> rowid,
});
typedef $$RepaymentScheduleTableTableUpdateCompanionBuilder
    = RepaymentScheduleTableCompanion Function({
  Value<String> id,
  Value<String> loanId,
  Value<int> installmentNumber,
  Value<String> dueDate,
  Value<double> principalDue,
  Value<double> interestDue,
  Value<double> totalDue,
  Value<double> principalPaid,
  Value<double> interestPaid,
  Value<double> totalPaid,
  Value<String> status,
  Value<int> rowid,
});

class $$RepaymentScheduleTableTableFilterComposer
    extends Composer<_$AppDatabase, $RepaymentScheduleTableTable> {
  $$RepaymentScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanId => $composableBuilder(
      column: $table.loanId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get principalDue => $composableBuilder(
      column: $table.principalDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestDue => $composableBuilder(
      column: $table.interestDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalDue => $composableBuilder(
      column: $table.totalDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get principalPaid => $composableBuilder(
      column: $table.principalPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get interestPaid => $composableBuilder(
      column: $table.interestPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$RepaymentScheduleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RepaymentScheduleTableTable> {
  $$RepaymentScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanId => $composableBuilder(
      column: $table.loanId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dueDate => $composableBuilder(
      column: $table.dueDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get principalDue => $composableBuilder(
      column: $table.principalDue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestDue => $composableBuilder(
      column: $table.interestDue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalDue => $composableBuilder(
      column: $table.totalDue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get principalPaid => $composableBuilder(
      column: $table.principalPaid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get interestPaid => $composableBuilder(
      column: $table.interestPaid,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPaid => $composableBuilder(
      column: $table.totalPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$RepaymentScheduleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepaymentScheduleTableTable> {
  $$RepaymentScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get loanId =>
      $composableBuilder(column: $table.loanId, builder: (column) => column);

  GeneratedColumn<int> get installmentNumber => $composableBuilder(
      column: $table.installmentNumber, builder: (column) => column);

  GeneratedColumn<String> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<double> get principalDue => $composableBuilder(
      column: $table.principalDue, builder: (column) => column);

  GeneratedColumn<double> get interestDue => $composableBuilder(
      column: $table.interestDue, builder: (column) => column);

  GeneratedColumn<double> get totalDue =>
      $composableBuilder(column: $table.totalDue, builder: (column) => column);

  GeneratedColumn<double> get principalPaid => $composableBuilder(
      column: $table.principalPaid, builder: (column) => column);

  GeneratedColumn<double> get interestPaid => $composableBuilder(
      column: $table.interestPaid, builder: (column) => column);

  GeneratedColumn<double> get totalPaid =>
      $composableBuilder(column: $table.totalPaid, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$RepaymentScheduleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RepaymentScheduleTableTable,
    RepaymentScheduleTableData,
    $$RepaymentScheduleTableTableFilterComposer,
    $$RepaymentScheduleTableTableOrderingComposer,
    $$RepaymentScheduleTableTableAnnotationComposer,
    $$RepaymentScheduleTableTableCreateCompanionBuilder,
    $$RepaymentScheduleTableTableUpdateCompanionBuilder,
    (
      RepaymentScheduleTableData,
      BaseReferences<_$AppDatabase, $RepaymentScheduleTableTable,
          RepaymentScheduleTableData>
    ),
    RepaymentScheduleTableData,
    PrefetchHooks Function()> {
  $$RepaymentScheduleTableTableTableManager(
      _$AppDatabase db, $RepaymentScheduleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepaymentScheduleTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RepaymentScheduleTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepaymentScheduleTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> loanId = const Value.absent(),
            Value<int> installmentNumber = const Value.absent(),
            Value<String> dueDate = const Value.absent(),
            Value<double> principalDue = const Value.absent(),
            Value<double> interestDue = const Value.absent(),
            Value<double> totalDue = const Value.absent(),
            Value<double> principalPaid = const Value.absent(),
            Value<double> interestPaid = const Value.absent(),
            Value<double> totalPaid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RepaymentScheduleTableCompanion(
            id: id,
            loanId: loanId,
            installmentNumber: installmentNumber,
            dueDate: dueDate,
            principalDue: principalDue,
            interestDue: interestDue,
            totalDue: totalDue,
            principalPaid: principalPaid,
            interestPaid: interestPaid,
            totalPaid: totalPaid,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String loanId,
            required int installmentNumber,
            required String dueDate,
            required double principalDue,
            required double interestDue,
            required double totalDue,
            Value<double> principalPaid = const Value.absent(),
            Value<double> interestPaid = const Value.absent(),
            Value<double> totalPaid = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RepaymentScheduleTableCompanion.insert(
            id: id,
            loanId: loanId,
            installmentNumber: installmentNumber,
            dueDate: dueDate,
            principalDue: principalDue,
            interestDue: interestDue,
            totalDue: totalDue,
            principalPaid: principalPaid,
            interestPaid: interestPaid,
            totalPaid: totalPaid,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RepaymentScheduleTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RepaymentScheduleTableTable,
        RepaymentScheduleTableData,
        $$RepaymentScheduleTableTableFilterComposer,
        $$RepaymentScheduleTableTableOrderingComposer,
        $$RepaymentScheduleTableTableAnnotationComposer,
        $$RepaymentScheduleTableTableCreateCompanionBuilder,
        $$RepaymentScheduleTableTableUpdateCompanionBuilder,
        (
          RepaymentScheduleTableData,
          BaseReferences<_$AppDatabase, $RepaymentScheduleTableTable,
              RepaymentScheduleTableData>
        ),
        RepaymentScheduleTableData,
        PrefetchHooks Function()>;
typedef $$RepaymentsTableTableCreateCompanionBuilder = RepaymentsTableCompanion
    Function({
  required String id,
  required String loanId,
  required double amount,
  required String paymentDate,
  Value<String> paymentMethod,
  Value<String> referenceNumber,
  required String receivedById,
  Value<String> notes,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$RepaymentsTableTableUpdateCompanionBuilder = RepaymentsTableCompanion
    Function({
  Value<String> id,
  Value<String> loanId,
  Value<double> amount,
  Value<String> paymentDate,
  Value<String> paymentMethod,
  Value<String> referenceNumber,
  Value<String> receivedById,
  Value<String> notes,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$RepaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RepaymentsTableTable> {
  $$RepaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get loanId => $composableBuilder(
      column: $table.loanId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get receivedById => $composableBuilder(
      column: $table.receivedById, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$RepaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RepaymentsTableTable> {
  $$RepaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get loanId => $composableBuilder(
      column: $table.loanId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get receivedById => $composableBuilder(
      column: $table.receivedById,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$RepaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepaymentsTableTable> {
  $$RepaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get loanId =>
      $composableBuilder(column: $table.loanId, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get paymentDate => $composableBuilder(
      column: $table.paymentDate, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber, builder: (column) => column);

  GeneratedColumn<String> get receivedById => $composableBuilder(
      column: $table.receivedById, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$RepaymentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RepaymentsTableTable,
    RepaymentsTableData,
    $$RepaymentsTableTableFilterComposer,
    $$RepaymentsTableTableOrderingComposer,
    $$RepaymentsTableTableAnnotationComposer,
    $$RepaymentsTableTableCreateCompanionBuilder,
    $$RepaymentsTableTableUpdateCompanionBuilder,
    (
      RepaymentsTableData,
      BaseReferences<_$AppDatabase, $RepaymentsTableTable, RepaymentsTableData>
    ),
    RepaymentsTableData,
    PrefetchHooks Function()> {
  $$RepaymentsTableTableTableManager(
      _$AppDatabase db, $RepaymentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepaymentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RepaymentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepaymentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> loanId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> paymentDate = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<String> referenceNumber = const Value.absent(),
            Value<String> receivedById = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RepaymentsTableCompanion(
            id: id,
            loanId: loanId,
            amount: amount,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNumber: referenceNumber,
            receivedById: receivedById,
            notes: notes,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String loanId,
            required double amount,
            required String paymentDate,
            Value<String> paymentMethod = const Value.absent(),
            Value<String> referenceNumber = const Value.absent(),
            required String receivedById,
            Value<String> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RepaymentsTableCompanion.insert(
            id: id,
            loanId: loanId,
            amount: amount,
            paymentDate: paymentDate,
            paymentMethod: paymentMethod,
            referenceNumber: referenceNumber,
            receivedById: receivedById,
            notes: notes,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RepaymentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RepaymentsTableTable,
    RepaymentsTableData,
    $$RepaymentsTableTableFilterComposer,
    $$RepaymentsTableTableOrderingComposer,
    $$RepaymentsTableTableAnnotationComposer,
    $$RepaymentsTableTableCreateCompanionBuilder,
    $$RepaymentsTableTableUpdateCompanionBuilder,
    (
      RepaymentsTableData,
      BaseReferences<_$AppDatabase, $RepaymentsTableTable, RepaymentsTableData>
    ),
    RepaymentsTableData,
    PrefetchHooks Function()>;
typedef $$SavingsAccountsTableTableCreateCompanionBuilder
    = SavingsAccountsTableCompanion Function({
  required String id,
  required String clientId,
  required String accountNumber,
  Value<String> accountType,
  Value<double> balance,
  Value<double> minimumBalance,
  Value<bool> isActive,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$SavingsAccountsTableTableUpdateCompanionBuilder
    = SavingsAccountsTableCompanion Function({
  Value<String> id,
  Value<String> clientId,
  Value<String> accountNumber,
  Value<String> accountType,
  Value<double> balance,
  Value<double> minimumBalance,
  Value<bool> isActive,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$SavingsAccountsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsAccountsTableTable> {
  $$SavingsAccountsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get balance => $composableBuilder(
      column: $table.balance, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get minimumBalance => $composableBuilder(
      column: $table.minimumBalance,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$SavingsAccountsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsAccountsTableTable> {
  $$SavingsAccountsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get balance => $composableBuilder(
      column: $table.balance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get minimumBalance => $composableBuilder(
      column: $table.minimumBalance,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$SavingsAccountsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsAccountsTableTable> {
  $$SavingsAccountsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get accountNumber => $composableBuilder(
      column: $table.accountNumber, builder: (column) => column);

  GeneratedColumn<String> get accountType => $composableBuilder(
      column: $table.accountType, builder: (column) => column);

  GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<double> get minimumBalance => $composableBuilder(
      column: $table.minimumBalance, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$SavingsAccountsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SavingsAccountsTableTable,
    SavingsAccountsTableData,
    $$SavingsAccountsTableTableFilterComposer,
    $$SavingsAccountsTableTableOrderingComposer,
    $$SavingsAccountsTableTableAnnotationComposer,
    $$SavingsAccountsTableTableCreateCompanionBuilder,
    $$SavingsAccountsTableTableUpdateCompanionBuilder,
    (
      SavingsAccountsTableData,
      BaseReferences<_$AppDatabase, $SavingsAccountsTableTable,
          SavingsAccountsTableData>
    ),
    SavingsAccountsTableData,
    PrefetchHooks Function()> {
  $$SavingsAccountsTableTableTableManager(
      _$AppDatabase db, $SavingsAccountsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsAccountsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsAccountsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsAccountsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> clientId = const Value.absent(),
            Value<String> accountNumber = const Value.absent(),
            Value<String> accountType = const Value.absent(),
            Value<double> balance = const Value.absent(),
            Value<double> minimumBalance = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavingsAccountsTableCompanion(
            id: id,
            clientId: clientId,
            accountNumber: accountNumber,
            accountType: accountType,
            balance: balance,
            minimumBalance: minimumBalance,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String clientId,
            required String accountNumber,
            Value<String> accountType = const Value.absent(),
            Value<double> balance = const Value.absent(),
            Value<double> minimumBalance = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavingsAccountsTableCompanion.insert(
            id: id,
            clientId: clientId,
            accountNumber: accountNumber,
            accountType: accountType,
            balance: balance,
            minimumBalance: minimumBalance,
            isActive: isActive,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SavingsAccountsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SavingsAccountsTableTable,
        SavingsAccountsTableData,
        $$SavingsAccountsTableTableFilterComposer,
        $$SavingsAccountsTableTableOrderingComposer,
        $$SavingsAccountsTableTableAnnotationComposer,
        $$SavingsAccountsTableTableCreateCompanionBuilder,
        $$SavingsAccountsTableTableUpdateCompanionBuilder,
        (
          SavingsAccountsTableData,
          BaseReferences<_$AppDatabase, $SavingsAccountsTableTable,
              SavingsAccountsTableData>
        ),
        SavingsAccountsTableData,
        PrefetchHooks Function()>;
typedef $$SavingsTransactionsTableTableCreateCompanionBuilder
    = SavingsTransactionsTableCompanion Function({
  required String id,
  required String savingsAccountId,
  required String transactionType,
  required double amount,
  required double balanceAfter,
  required String transactionDate,
  required String performedById,
  Value<String> referenceNumber,
  Value<String> notes,
  Value<String> syncStatus,
  required String createdAt,
  required String updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});
typedef $$SavingsTransactionsTableTableUpdateCompanionBuilder
    = SavingsTransactionsTableCompanion Function({
  Value<String> id,
  Value<String> savingsAccountId,
  Value<String> transactionType,
  Value<double> amount,
  Value<double> balanceAfter,
  Value<String> transactionDate,
  Value<String> performedById,
  Value<String> referenceNumber,
  Value<String> notes,
  Value<String> syncStatus,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> version,
  Value<bool> isDeleted,
  Value<int> rowid,
});

class $$SavingsTransactionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SavingsTransactionsTableTable> {
  $$SavingsTransactionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get savingsAccountId => $composableBuilder(
      column: $table.savingsAccountId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get performedById => $composableBuilder(
      column: $table.performedById, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));
}

class $$SavingsTransactionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SavingsTransactionsTableTable> {
  $$SavingsTransactionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get savingsAccountId => $composableBuilder(
      column: $table.savingsAccountId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionType => $composableBuilder(
      column: $table.transactionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get performedById => $composableBuilder(
      column: $table.performedById,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));
}

class $$SavingsTransactionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SavingsTransactionsTableTable> {
  $$SavingsTransactionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get savingsAccountId => $composableBuilder(
      column: $table.savingsAccountId, builder: (column) => column);

  GeneratedColumn<String> get transactionType => $composableBuilder(
      column: $table.transactionType, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get balanceAfter => $composableBuilder(
      column: $table.balanceAfter, builder: (column) => column);

  GeneratedColumn<String> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<String> get performedById => $composableBuilder(
      column: $table.performedById, builder: (column) => column);

  GeneratedColumn<String> get referenceNumber => $composableBuilder(
      column: $table.referenceNumber, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);
}

class $$SavingsTransactionsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SavingsTransactionsTableTable,
    SavingsTransactionsTableData,
    $$SavingsTransactionsTableTableFilterComposer,
    $$SavingsTransactionsTableTableOrderingComposer,
    $$SavingsTransactionsTableTableAnnotationComposer,
    $$SavingsTransactionsTableTableCreateCompanionBuilder,
    $$SavingsTransactionsTableTableUpdateCompanionBuilder,
    (
      SavingsTransactionsTableData,
      BaseReferences<_$AppDatabase, $SavingsTransactionsTableTable,
          SavingsTransactionsTableData>
    ),
    SavingsTransactionsTableData,
    PrefetchHooks Function()> {
  $$SavingsTransactionsTableTableTableManager(
      _$AppDatabase db, $SavingsTransactionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavingsTransactionsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$SavingsTransactionsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavingsTransactionsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> savingsAccountId = const Value.absent(),
            Value<String> transactionType = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double> balanceAfter = const Value.absent(),
            Value<String> transactionDate = const Value.absent(),
            Value<String> performedById = const Value.absent(),
            Value<String> referenceNumber = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavingsTransactionsTableCompanion(
            id: id,
            savingsAccountId: savingsAccountId,
            transactionType: transactionType,
            amount: amount,
            balanceAfter: balanceAfter,
            transactionDate: transactionDate,
            performedById: performedById,
            referenceNumber: referenceNumber,
            notes: notes,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String savingsAccountId,
            required String transactionType,
            required double amount,
            required double balanceAfter,
            required String transactionDate,
            required String performedById,
            Value<String> referenceNumber = const Value.absent(),
            Value<String> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> version = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavingsTransactionsTableCompanion.insert(
            id: id,
            savingsAccountId: savingsAccountId,
            transactionType: transactionType,
            amount: amount,
            balanceAfter: balanceAfter,
            transactionDate: transactionDate,
            performedById: performedById,
            referenceNumber: referenceNumber,
            notes: notes,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            version: version,
            isDeleted: isDeleted,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SavingsTransactionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SavingsTransactionsTableTable,
        SavingsTransactionsTableData,
        $$SavingsTransactionsTableTableFilterComposer,
        $$SavingsTransactionsTableTableOrderingComposer,
        $$SavingsTransactionsTableTableAnnotationComposer,
        $$SavingsTransactionsTableTableCreateCompanionBuilder,
        $$SavingsTransactionsTableTableUpdateCompanionBuilder,
        (
          SavingsTransactionsTableData,
          BaseReferences<_$AppDatabase, $SavingsTransactionsTableTable,
              SavingsTransactionsTableData>
        ),
        SavingsTransactionsTableData,
        PrefetchHooks Function()>;
typedef $$SyncQueueTableTableCreateCompanionBuilder = SyncQueueTableCompanion
    Function({
  Value<int> id,
  required String entityType,
  required String entityId,
  required String operation,
  required String payload,
  Value<String> status,
  Value<int> retryCount,
  Value<String?> lastError,
  required String createdAt,
});
typedef $$SyncQueueTableTableUpdateCompanionBuilder = SyncQueueTableCompanion
    Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> entityId,
  Value<String> operation,
  Value<String> payload,
  Value<String> status,
  Value<int> retryCount,
  Value<String?> lastError,
  Value<String> createdAt,
});

class $$SyncQueueTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SyncQueueTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTableTable,
    SyncQueueTableData,
    $$SyncQueueTableTableFilterComposer,
    $$SyncQueueTableTableOrderingComposer,
    $$SyncQueueTableTableAnnotationComposer,
    $$SyncQueueTableTableCreateCompanionBuilder,
    $$SyncQueueTableTableUpdateCompanionBuilder,
    (
      SyncQueueTableData,
      BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>
    ),
    SyncQueueTableData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableTableManager(
      _$AppDatabase db, $SyncQueueTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
          }) =>
              SyncQueueTableCompanion(
            id: id,
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            payload: payload,
            status: status,
            retryCount: retryCount,
            lastError: lastError,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String entityId,
            required String operation,
            required String payload,
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
            required String createdAt,
          }) =>
              SyncQueueTableCompanion.insert(
            id: id,
            entityType: entityType,
            entityId: entityId,
            operation: operation,
            payload: payload,
            status: status,
            retryCount: retryCount,
            lastError: lastError,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTableTable,
    SyncQueueTableData,
    $$SyncQueueTableTableFilterComposer,
    $$SyncQueueTableTableOrderingComposer,
    $$SyncQueueTableTableAnnotationComposer,
    $$SyncQueueTableTableCreateCompanionBuilder,
    $$SyncQueueTableTableUpdateCompanionBuilder,
    (
      SyncQueueTableData,
      BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>
    ),
    SyncQueueTableData,
    PrefetchHooks Function()>;
typedef $$CachedUsersTableTableCreateCompanionBuilder
    = CachedUsersTableCompanion Function({
  required String id,
  required String username,
  Value<String> email,
  Value<String> firstName,
  Value<String> lastName,
  required String role,
  Value<String?> branchId,
  Value<String?> branchName,
  Value<String> phoneNumber,
  Value<int> rowid,
});
typedef $$CachedUsersTableTableUpdateCompanionBuilder
    = CachedUsersTableCompanion Function({
  Value<String> id,
  Value<String> username,
  Value<String> email,
  Value<String> firstName,
  Value<String> lastName,
  Value<String> role,
  Value<String?> branchId,
  Value<String?> branchName,
  Value<String> phoneNumber,
  Value<int> rowid,
});

class $$CachedUsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $CachedUsersTableTable> {
  $$CachedUsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get branchName => $composableBuilder(
      column: $table.branchName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnFilters(column));
}

class $$CachedUsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedUsersTableTable> {
  $$CachedUsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchId => $composableBuilder(
      column: $table.branchId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get branchName => $composableBuilder(
      column: $table.branchName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => ColumnOrderings(column));
}

class $$CachedUsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedUsersTableTable> {
  $$CachedUsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get branchId =>
      $composableBuilder(column: $table.branchId, builder: (column) => column);

  GeneratedColumn<String> get branchName => $composableBuilder(
      column: $table.branchName, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
      column: $table.phoneNumber, builder: (column) => column);
}

class $$CachedUsersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedUsersTableTable,
    CachedUsersTableData,
    $$CachedUsersTableTableFilterComposer,
    $$CachedUsersTableTableOrderingComposer,
    $$CachedUsersTableTableAnnotationComposer,
    $$CachedUsersTableTableCreateCompanionBuilder,
    $$CachedUsersTableTableUpdateCompanionBuilder,
    (
      CachedUsersTableData,
      BaseReferences<_$AppDatabase, $CachedUsersTableTable,
          CachedUsersTableData>
    ),
    CachedUsersTableData,
    PrefetchHooks Function()> {
  $$CachedUsersTableTableTableManager(
      _$AppDatabase db, $CachedUsersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedUsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedUsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedUsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String?> branchId = const Value.absent(),
            Value<String?> branchName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedUsersTableCompanion(
            id: id,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            role: role,
            branchId: branchId,
            branchName: branchName,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            Value<String> email = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            required String role,
            Value<String?> branchId = const Value.absent(),
            Value<String?> branchName = const Value.absent(),
            Value<String> phoneNumber = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedUsersTableCompanion.insert(
            id: id,
            username: username,
            email: email,
            firstName: firstName,
            lastName: lastName,
            role: role,
            branchId: branchId,
            branchName: branchName,
            phoneNumber: phoneNumber,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedUsersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedUsersTableTable,
    CachedUsersTableData,
    $$CachedUsersTableTableFilterComposer,
    $$CachedUsersTableTableOrderingComposer,
    $$CachedUsersTableTableAnnotationComposer,
    $$CachedUsersTableTableCreateCompanionBuilder,
    $$CachedUsersTableTableUpdateCompanionBuilder,
    (
      CachedUsersTableData,
      BaseReferences<_$AppDatabase, $CachedUsersTableTable,
          CachedUsersTableData>
    ),
    CachedUsersTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ClientsTableTableTableManager get clientsTable =>
      $$ClientsTableTableTableManager(_db, _db.clientsTable);
  $$GroupsTableTableTableManager get groupsTable =>
      $$GroupsTableTableTableManager(_db, _db.groupsTable);
  $$GroupMembershipsTableTableTableManager get groupMembershipsTable =>
      $$GroupMembershipsTableTableTableManager(_db, _db.groupMembershipsTable);
  $$LoanProductsTableTableTableManager get loanProductsTable =>
      $$LoanProductsTableTableTableManager(_db, _db.loanProductsTable);
  $$LoanApplicationsTableTableTableManager get loanApplicationsTable =>
      $$LoanApplicationsTableTableTableManager(_db, _db.loanApplicationsTable);
  $$LoansTableTableTableManager get loansTable =>
      $$LoansTableTableTableManager(_db, _db.loansTable);
  $$RepaymentScheduleTableTableTableManager get repaymentScheduleTable =>
      $$RepaymentScheduleTableTableTableManager(
          _db, _db.repaymentScheduleTable);
  $$RepaymentsTableTableTableManager get repaymentsTable =>
      $$RepaymentsTableTableTableManager(_db, _db.repaymentsTable);
  $$SavingsAccountsTableTableTableManager get savingsAccountsTable =>
      $$SavingsAccountsTableTableTableManager(_db, _db.savingsAccountsTable);
  $$SavingsTransactionsTableTableTableManager get savingsTransactionsTable =>
      $$SavingsTransactionsTableTableTableManager(
          _db, _db.savingsTransactionsTable);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(_db, _db.syncQueueTable);
  $$CachedUsersTableTableTableManager get cachedUsersTable =>
      $$CachedUsersTableTableTableManager(_db, _db.cachedUsersTable);
}
