import 'package:injectable/injectable.dart';

import '../../../../domain/entities/chat_entity.dart';
import '../../../api/api_manger.dart';
import 'chat_remote_data_source.dart';

@Injectable(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ApiManger apiManger;
  ChatRemoteDataSourceImpl(this.apiManger);
  @override
  Future<List<ChatEntity>> getAllQuestions() async {
    var response = await apiManger.getAllQuestions();
    if (response.questions!.isEmpty) {
      return [];
    } else {
      return response.questions!
          .map((e) => ChatEntity(id: e.id ?? 0, question: e.question ?? ""))
          .toList();
    }
  }

  @override
  Future<ChatEntity> getAnswer(String id) async {
    var response = await apiManger.getAnswer(int.parse(id));
    return ChatEntity(answer: response.answer ?? "");
  }
}
