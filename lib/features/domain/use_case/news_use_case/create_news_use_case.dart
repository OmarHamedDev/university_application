import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/news_entity.dart';
import '../../repositories/new_repository.dart';

@injectable
class CreateNewsUseCase {
  final NewRepository newsRepository;
  CreateNewsUseCase({required this.newsRepository});
  Future<Result<String>> invoke({
    required String title,
    required String content,
  }) async {
    return newsRepository.createNews(title: title, content: content);
  }
}
