class ClientModel {
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

  const ClientModel({
    required this.id,
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
    required this.isDeleted,
  });

  String get fullName => '$firstName $lastName'.trim();

  String get genderDisplay => switch (gender) {
        'M' => 'Male',
        'F' => 'Female',
        _ => 'Other',
      };

  bool get isPendingSync => syncStatus == 'pending';

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as String,
      nationalId: json['national_id'] as String,
      phoneNumber: json['phone_number'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      gender: json['gender'] as String,
      address: json['address'] as String,
      photoPath: json['photo'] as String?,
      nextOfKinName: json['next_of_kin_name'] as String? ?? '',
      nextOfKinPhone: json['next_of_kin_phone'] as String? ?? '',
      branchId: (json['branch'] ?? json['branch_id']) as String,
      createdById: (json['created_by'] ?? json['created_by_id']) as String,
      isActive: json['is_active'] as bool? ?? true,
      syncStatus: json['sync_status'] as String? ?? 'synced',
      createdAt: json['created_at'] as String? ?? DateTime.now().toIso8601String(),
      updatedAt: json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
      version: json['version'] as int? ?? 1,
      isDeleted: json['is_deleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toSyncPayload() => {
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
        'branch_id': branchId,
        'created_by_id': createdById,
        'is_active': isActive,
        'updated_at': updatedAt,
        'version': version,
        'is_deleted': isDeleted,
      };
}

class GroupModel {
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
  final String updatedAt;

  const GroupModel({
    required this.id,
    required this.name,
    required this.groupType,
    required this.branchId,
    required this.loanOfficerId,
    required this.meetingDay,
    required this.meetingFrequency,
    required this.meetingLocation,
    required this.isActive,
    required this.syncStatus,
    required this.updatedAt,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) {
    return GroupModel(
      id: json['id'] as String,
      name: json['name'] as String,
      groupType: json['group_type'] as String,
      branchId: (json['branch'] ?? json['branch_id']) as String,
      loanOfficerId: (json['loan_officer'] ?? json['loan_officer_id']) as String,
      meetingDay: json['meeting_day'] as String? ?? '',
      meetingFrequency: json['meeting_frequency'] as String? ?? '',
      meetingLocation: json['meeting_location'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      syncStatus: json['sync_status'] as String? ?? 'synced',
      updatedAt: json['updated_at'] as String? ?? DateTime.now().toIso8601String(),
    );
  }
}
