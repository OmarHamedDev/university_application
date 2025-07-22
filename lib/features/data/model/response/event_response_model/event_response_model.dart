import 'package:json_annotation/json_annotation.dart';

part 'event_response_model.g.dart';

@JsonSerializable()
class EventResponseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "start_time")
  final String? startTime;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  EventResponseModel ({
    this.id,
    this.title,
    this.image,
    this.description,
    this.startTime,
    this.createdAt,
    this.updatedAt,
  });

  factory EventResponseModel.fromJson(Map<String, dynamic> json) {
    return _$EventResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EventResponseModelToJson(this);
  }
}


