class AppUserEntity {
  final int id;
  final String email;
  final String fullName;
  final String role;
  final String? phoneNumber;
  final String? profilePhoto;
  final int? totalUnits;
  final String major;
  AppUserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.phoneNumber,
    this.profilePhoto,
    this.totalUnits,
    required this.major,
  });


}
