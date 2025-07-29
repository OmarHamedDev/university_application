// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_questions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllQuestionsResponseModel _$GetAllQuestionsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAllQuestionsResponseModel(
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllQuestionsResponseModelToJson(
        GetAllQuestionsResponseModel instance) =>
    <String, dynamic>{
      'questions': instance.questions,
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      id: (json['id'] as num?)?.toInt(),
      question: json['question'] as String?,
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
    };
