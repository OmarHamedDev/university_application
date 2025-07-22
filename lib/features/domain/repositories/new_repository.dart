import '../../../core/api/network/common/result.dart';
import '../entities/news_entity.dart';

abstract class NewRepository {
  Future<Result<List<NewsEntity>>> getAllNews();
   Future<Result<String>> createNews({
     required String title,
     required String content
});
   Future<Result<String>> deleteNews({required int id});

}