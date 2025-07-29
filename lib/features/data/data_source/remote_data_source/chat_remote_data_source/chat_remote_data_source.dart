import '../../../../domain/entities/chat_entity.dart';

abstract class ChatRemoteDataSource {
  Future<List<ChatEntity>> getAllQuestions();
  Future<ChatEntity> getAnswer(String id);
}