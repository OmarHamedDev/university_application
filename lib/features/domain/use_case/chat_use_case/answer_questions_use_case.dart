import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/chat_entity.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/chat_repository.dart';

@injectable
class AnswerQuestionsUseCase {
  final ChatRepository chatRepository;
  AnswerQuestionsUseCase({required this.chatRepository});

  Future<Result<ChatEntity>> invoke(String id) async {
    return chatRepository.getAnswer(id);
  }
}
