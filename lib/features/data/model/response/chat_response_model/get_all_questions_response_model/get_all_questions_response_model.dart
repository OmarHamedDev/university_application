import 'package:json_annotation/json_annotation.dart';

part 'get_all_questions_response_model.g.dart';

@JsonSerializable()
class GetAllQuestionsResponseModel {
  @JsonKey(name: "questions")
  final List<Questions>? questions;

  GetAllQuestionsResponseModel ({
    this.questions,
  });

  factory GetAllQuestionsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAllQuestionsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetAllQuestionsResponseModelToJson(this);
  }
}

@JsonSerializable()
class Questions {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "question")
  final String? question;

  Questions ({
    this.id,
    this.question,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsToJson(this);
  }
}


