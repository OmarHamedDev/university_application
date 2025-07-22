import 'package:hive/hive.dart';

part 'app_user_local_model.g.dart';

@HiveType(typeId: 2)
class AppUserLocalModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String fullName;
  @HiveField(3)
  final String role;
  @HiveField(4)
  final String phoneNumber;
  @HiveField(5)
  final String profilePhoto;
  @HiveField(6)
  final int totalUnits;
  @HiveField(7)
  final String major;
  AppUserLocalModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
   required this.phoneNumber,
    required  this.profilePhoto,
 required   this.totalUnits,
    required this.major
  });
}

