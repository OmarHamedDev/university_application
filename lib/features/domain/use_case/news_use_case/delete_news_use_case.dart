import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/news_entity.dart';
import '../../repositories/new_repository.dart';

@injectable
class DeleteNewsUseCase {
  final NewRepository newsRepository;
  DeleteNewsUseCase({required this.newsRepository});
  Future<Result<String>>invoke({required int id})async{
    return newsRepository.deleteNews(id: id);
  }
}