import 'package:json_annotation/json_annotation.dart';

part 'admin_student_request_response_model.g.dart';

@JsonSerializable()
class AdminStudentRequestResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "requests")
  final List<Requests>? requests;

  AdminStudentRequestResponseModel ({
    this.status,
    this.requests,
  });

  factory AdminStudentRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AdminStudentRequestResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdminStudentRequestResponseModelToJson(this);
  }
}

@JsonSerializable()
class Requests {
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
  @JsonKey(name: "admin_status")
  final String? adminStatus;
  @JsonKey(name: "student_name_en")
  final String? studentNameEn;
  @JsonKey(name: "student_name_ar")
  final String? studentNameAr;
  @JsonKey(name: "department")
  final String? department;
  @JsonKey(name: "receipt_image")
  final String? receiptImage;

  Requests ({
    this.requestId,
    this.typeId,
    this.typeName,
    this.count,
    this.totalPrice,
    this.status,
    this.adminStatus,
    this.studentNameEn,
    this.studentNameAr,
    this.department,
    this.receiptImage,
  });

  factory Requests.fromJson(Map<String, dynamic> json) {
    return _$RequestsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestsToJson(this);
  }
}


