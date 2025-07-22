import 'package:hti_university_app_1/features/data/model/response/news_response_model/news_response_model.dart';

import '../../../../domain/entities/news_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsEntity>>getAllNews();
  Future<String >createNews({
    required String title,
    required String content
});
  Future<String>deleteNews({required int id});
}