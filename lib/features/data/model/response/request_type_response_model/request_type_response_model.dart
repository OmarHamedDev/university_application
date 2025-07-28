import 'package:json_annotation/json_annotation.dart';

part 'request_type_response_model.g.dart';

@JsonSerializable()
class RequestTypeResponseModel {
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "types")
  final List<Types>? types;

  RequestTypeResponseModel ({
    this.status,
    this.types,
  });

  factory RequestTypeResponseModel.fromJson(Map<String, dynamic> json) {
    return _$RequestTypeResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestTypeResponseModelToJson(this);
  }
}

@JsonSerializable()
class Types {
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

  Types ({
    this.id,
    this.name,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory Types.fromJson(Map<String, dynamic> json) {
    return _$TypesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TypesToJson(this);
  }
}


