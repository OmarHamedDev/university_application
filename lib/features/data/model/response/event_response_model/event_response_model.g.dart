// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponseModel _$EventResponseModelFromJson(Map<String, dynamic> json) =>
    EventResponseModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      startTime: json['start_time'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$EventResponseModelToJson(EventResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'description': instance.description,
      'start_time': instance.startTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
