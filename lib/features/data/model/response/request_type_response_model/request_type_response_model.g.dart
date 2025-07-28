// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_type_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTypeResponseModel _$RequestTypeResponseModelFromJson(
        Map<String, dynamic> json) =>
    RequestTypeResponseModel(
      status: json['status'] as String?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestTypeResponseModelToJson(
        RequestTypeResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'types': instance.types,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
