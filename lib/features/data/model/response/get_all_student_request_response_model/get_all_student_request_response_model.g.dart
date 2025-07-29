// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStudentRequestResponseModel _$GetAllStudentRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllStudentRequestResponseModel(
      status: json['status'] as String?,
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => Requests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllStudentRequestResponseModelToJson(
        GetAllStudentRequestResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'requests': instance.requests,
    };

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$RequestsToJson(Requests instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
