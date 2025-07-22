// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUserResponseModel _$AppUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    AppUserResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppUserResponseModelToJson(
        AppUserResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      personalEmail: json['personal_email'] as String?,
      type: json['type'] as String?,
      major: json['major'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'personal_email': instance.personalEmail,
      'type': instance.type,
      'major': instance.major,
      'phone_number': instance.phoneNumber,
      'profile_photo': instance.profilePhoto,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
