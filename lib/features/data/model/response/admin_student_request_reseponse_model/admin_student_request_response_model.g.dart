// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_student_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminStudentRequestResponseModel _$AdminStudentRequestResponseModelFromJson(
        Map<String, dynamic> json) =>
    AdminStudentRequestResponseModel(
      status: json['status'] as String?,
      requests: (json['requests'] as List<dynamic>?)
          ?.map((e) => Requests.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminStudentRequestResponseModelToJson(
        AdminStudentRequestResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'requests': instance.requests,
    };

Requests _$RequestsFromJson(Map<String, dynamic> json) => Requests(
      requestId: (json['request_id'] as num?)?.toInt(),
      typeId: json['type_id'] as String?,
      typeName: json['type_name'] as String?,
      count: json['count'] as String?,
      totalPrice: json['total_price'] as String?,
      status: json['status'] as String?,
      adminStatus: json['admin_status'] as String?,
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
      'admin_status': instance.adminStatus,
      'student_name_en': instance.studentNameEn,
      'student_name_ar': instance.studentNameAr,
      'department': instance.department,
      'receipt_image': instance.receiptImage,
    };
