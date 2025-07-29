part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
class GetAllQuestionsLoadingState extends ChatState{}
class GetAllQuestionsSuccessState extends ChatState{}
class GetAllQuestionsErrorState extends ChatState{
  final Exception exception;
  GetAllQuestionsErrorState(this.exception);
}
class AnswerQuestionLoadingState extends ChatState{}
class AnswerQuestionSuccessState extends ChatState{}
class AnswerQuestionErrorState extends ChatState{
  final Exception exception;
  AnswerQuestionErrorState(this.exception);
}