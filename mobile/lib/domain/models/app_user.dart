class AppUser {
  final String id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String role;
  final String? branchId;
  final String? branchName;
  final String phoneNumber;

  const AppUser({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.branchId,
    this.branchName,
    required this.phoneNumber,
  });

  String get fullName => '$firstName $lastName'.trim();

  factory AppUser.fromJson(Map<String, dynamic> json) {
    final branch = json['branch'] as Map<String, dynamic>?;
    return AppUser(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      role: json['role'] as String,
      branchId: (branch?['id'] ?? json['branch_id']) as String?,
      branchName: (branch?['name'] ?? json['branch_name']) as String?,
      phoneNumber: json['phone_number'] as String? ?? '',
    );
  }

  bool get isFieldOfficer => role == 'field_officer';
  bool get isBranchManager => role == 'branch_manager';
  bool get isAdmin => role == 'admin';
  bool get isAuditor => role == 'auditor';
  bool get canWrite => role != 'auditor';
}
