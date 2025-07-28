// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_panding_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminPandingResponseModel _$AdminPandingResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminPandingResponseModel(
      status: json['status'] as String?,
      request: json['request'] == null
          ? null
          : Request.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdminPandingResponseModelToJson(
        AdminPandingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'request': instance.request,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      requestId: (json['request_id'] as num?)?.toInt(),
      typeId: json['type_id'] as String?,
      typeName: json['type_name'] as String?,
      count: json['count'] as String?,
      totalPrice: json['total_price'] as String?,
      status: json['status'] as String?,
      notes: json['notes'],
      studentNameEn: json['student_name_en'] as String?,
      studentNameAr: json['student_name_ar'] as String?,
      department: json['department'] as String?,
      receiptImage: json['receipt_image'] as String?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
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
