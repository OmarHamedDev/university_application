import 'package:bloc/bloc.dart';
import 'package:hti_university_app_1/features/domain/entities/chat_entity.dart';
import 'package:hti_university_app_1/features/domain/use_case/chat_use_case/get_all_questions_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../core/api/network/common/result.dart';
import '../../../../../../domain/use_case/chat_use_case/answer_questions_use_case.dart';

part 'chat_state.dart';

@internal
@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetAllQuestionsUseCase _allQuestionsUseCase;
  final AnswerQuestionsUseCase _answerQuestionsUseCase;
  ChatCubit(this._allQuestionsUseCase, this._answerQuestionsUseCase)
    : super(ChatInitial());

  List<ChatEntity> chats = [];
  Future<void> getAllQuestions() async {
    emit(GetAllQuestionsLoadingState());
    var result = await _allQuestionsUseCase.invoke();
    switch (result) {
      case Success<List<ChatEntity>>():
        chats = result.data ?? [];
        emit(GetAllQuestionsSuccessState());
        break;
      case Failures<List<ChatEntity>>():
        emit(GetAllQuestionsErrorState(result.exception));
        break;
    }
  }

  String chatMassage = "";
  Future<void> answerQuestions(String idQuestion) async {
    print('Requesting answer for idQuestion: $idQuestion');
    emit(AnswerQuestionLoadingState());

    var result = await _answerQuestionsUseCase.invoke(idQuestion);
    switch (result) {
      case Success<ChatEntity>():
        final updatedAnswer = result.data;

        // 👇 تحديث العنصر في القائمة
        final index = chats.indexWhere((e) => e.id.toString() == idQuestion);
        if (index != -1 && updatedAnswer != null) {
          chats[index].answer = updatedAnswer.answer;
        }

        chatMassage = updatedAnswer?.answer ?? "";
        emit(AnswerQuestionSuccessState());

      case Failures<ChatEntity>():
        emit(AnswerQuestionErrorState(result.exception));
    }
  }
}
