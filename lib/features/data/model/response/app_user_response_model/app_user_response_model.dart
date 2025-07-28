import 'package:json_annotation/json_annotation.dart';

part 'app_user_response_model.g.dart';

@JsonSerializable()
class AppUserResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final User? user;

  AppUserResponseModel ({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  factory AppUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AppUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AppUserResponseModelToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "personal_email")
  final String? personalEmail;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "major")
  final String? major;
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @JsonKey(name: "profile_photo_url")
  final String? profilePhoto;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  User ({
    this.id,
    this.name,
    this.email,
    this.personalEmail,
    this.type,
    this.major,
    this.phoneNumber,
    this.profilePhoto,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}


