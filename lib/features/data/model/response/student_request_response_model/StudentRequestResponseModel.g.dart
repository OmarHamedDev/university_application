// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StudentRequestResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student_request_response_model _$Student_request_response_modelFromJson(
        Map<String, dynamic> json) =>
    Student_request_response_model(
      status: json['status'] as String?,
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => Requests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Student_request_response_modelToJson(
        Student_request_response_model instance) =>
    <String, dynamic>{
      'status': instance.status,
      'requests': instance.requests,
    };

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      requestId: (json['request_id'] as num?)?.toInt(),
      typeId: json['type_id'] as String?,
      typeName: json['type_name'],
      count: json['count'] as String?,
      totalPrice: json['total_price'] as String?,
      status: json['status'] as String?,
      notes: json['notes'],
      studentNameEn: json['student_name_en'] as String?,
      studentNameAr: json['student_name_ar'] as String?,
      department: json['department'] as String?,
      receiptImage: json['receipt_image'] as String?,
    );

Map<String, dynamic> _$RequestsToJson(Requests instance) => <String, dynamic>{
      'request_id': instance.requestId,
      'type_id': instance.typeId,
      'type_name': instance.typeName,
      'count': instance.count,
      'total_price': instance.totalPrice,
      'status': instance.status,
      'notes': instance.notes,
      'student_name_en': instance.studentNameEn,
      'student_name_ar': instance.studentNameAr,
      'department': instance.department,
      'receipt_image': instance.receiptImage,
    };
