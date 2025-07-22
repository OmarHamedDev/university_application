// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseModel _$NewsResponseModelFromJson(Map<String, dynamic> json) =>
    NewsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$NewsResponseModelToJson(NewsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
