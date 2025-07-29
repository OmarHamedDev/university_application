import 'package:json_annotation/json_annotation.dart';

part 'answer_question_response_model.g.dart';

@JsonSerializable()
class AnswerQuestionResponseModel {
  @JsonKey(name: "answer")
  final String? answer;

  AnswerQuestionResponseModel ({
    this.answer,
  });

  factory AnswerQuestionResponseModel.fromJson(Map<String, dynamic> json) {
    return _$AnswerQuestionResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswerQuestionResponseModelToJson(this);
  }
}


