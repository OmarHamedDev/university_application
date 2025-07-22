import 'package:json_annotation/json_annotation.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "content")
  final String? content;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  NewsResponseModel ({
    this.id,
    this.title,
    this.content,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$NewsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$NewsResponseModelToJson(this);
  }
}


