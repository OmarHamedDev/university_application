import 'package:json_annotation/json_annotation.dart';

part 'get_all_student_request_response_model.g.dart';

@JsonSerializable()
class GetAllStudentRequestResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "requests")
  final List<Requests>? requests;

  GetAllStudentRequestResponseModel ({
    this.status,
    this.requests,
  });

  factory GetAllStudentRequestResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllStudentRequestResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllStudentRequestResponseModelToJson(this);
  }
}

@JsonSerializable()
class Requests {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "price")
  final String? price;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  Requests ({
    this.id,
    this.name,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Requests.fromJson(Map<String, dynamic> json) {
    return _$RequestsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestsToJson(this);
  }
}


