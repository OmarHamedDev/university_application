import 'package:json_annotation/json_annotation.dart';

part 'admin_panding_response_model.g.dart';

@JsonSerializable()
class AdminPandingResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "request")
  final Request? request;

  AdminPandingResponseModel ({
    this.status,
    this.request,
  });

  factory AdminPandingResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AdminPandingResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdminPandingResponseModelToJson(this);
  }
}

@JsonSerializable()
class Request {
  @JsonKey(name: "request_id")
  final int? requestId;
  @JsonKey(name: "type_id")
  final String? typeId;
  @JsonKey(name: "type_name")
  final String? typeName;
  @JsonKey(name: "count")
  final String? count;
  @JsonKey(name: "total_price")
  final String? totalPrice;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "notes")
  final dynamic? notes;
  @JsonKey(name: "student_name_en")
  final String? studentNameEn;
  @JsonKey(name: "student_name_ar")
  final String? studentNameAr;
  @JsonKey(name: "department")
  final String? department;
  @JsonKey(name: "receipt_image")
  final String? receiptImage;

  Request ({
    this.requestId,
    this.typeId,
    this.typeName,
    this.count,
    this.totalPrice,
    this.status,
    this.notes,
    this.studentNameEn,
    this.studentNameAr,
    this.department,
    this.receiptImage,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return _$RequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestToJson(this);
  }
}


