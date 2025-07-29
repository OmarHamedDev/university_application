import 'package:json_annotation/json_annotation.dart';

part 'StudentRequestResponseModel.g.dart';

@JsonSerializable()
class Student_request_response_model {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "requests")
  final List<Requests>? requests;

  Student_request_response_model ({
    this.status,
    this.requests,
  });

  factory Student_request_response_model.fromJson(Map<String, dynamic> json) {
    return _$Student_request_response_modelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Student_request_response_modelToJson(this);
  }
}

@JsonSerializable()
class Requests {
  @JsonKey(name: "request_id")
  final int? requestId;
  @JsonKey(name: "type_id")
  final String? typeId;
  @JsonKey(name: "type_name")
  final dynamic? typeName;
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

  Requests ({
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

  factory Requests.fromJson(Map<String, dynamic> json) {
    return _$RequestsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestsToJson(this);
  }
}


