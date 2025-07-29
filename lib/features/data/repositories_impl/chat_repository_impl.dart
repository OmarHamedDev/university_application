import 'package:hti_university_app_1/core/api/network/common/execute_method.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/chat_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/chat_repository.dart';
import '../data_source/remote_data_source/chat_remote_data_source/chat_remote_data_source.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource chatRemoteDataSource;
  ChatRepositoryImpl({required this.chatRemoteDataSource});
  @override
  Future<Result<List<ChatEntity>>> getAllQuestions() async {
    return executeMethod<List<ChatEntity>>(
      callMethod: () async {
        return await chatRemoteDataSource.getAllQuestions();
      },
    );
  }

  @override
  Future<Result<ChatEntity>> getAnswer(String id) async {
    return executeMethod(
      callMethod: () {
        return chatRemoteDataSource.getAnswer(id);
      },
    );
  }
}
