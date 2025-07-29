import '../../../core/api/network/common/result.dart';
import '../entities/chat_entity.dart';

abstract class ChatRepository {
  Future<Result<List<ChatEntity>>> getAllQuestions();
  Future<Result<ChatEntity>> getAnswer(String id);
}