import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../entities/news_entity.dart';
import '../../repositories/new_repository.dart';

@injectable
class GetAllNewsUseCase {
  final NewRepository newsRepository;
  GetAllNewsUseCase({required this.newsRepository});
  Future<Result<List<NewsEntity>>>invoke()async{
    return newsRepository.getAllNews();
  }
}