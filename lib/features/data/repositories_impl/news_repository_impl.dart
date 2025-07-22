import 'package:hti_university_app_1/core/api/network/common/execute_method.dart';
import 'package:hti_university_app_1/core/api/network/common/result.dart';
import 'package:hti_university_app_1/features/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/new_repository.dart';
import '../data_source/remote_data_source/news_remote_data_source/news_remote_data_source.dart';

@Injectable(as: NewRepository)
class NewsRepositoryImpl implements NewRepository {
  final NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<Result<List<NewsEntity>>> getAllNews() async {
    return executeMethod<List<NewsEntity>>(
      callMethod: () async {
        var news = await newsRemoteDataSource.getAllNews();
        return news;
      },
    );
  }

  @override
  Future<Result<String>> createNews({
    required String title,
    required String content,
  }) async {
    return executeMethod<String>(
      callMethod: () async {
        var news = newsRemoteDataSource.createNews(
          title: title,
          content: content,
        );
        return news;
      },
    );
  }

  @override
  Future<Result<String>> deleteNews({required int id}) async {
    return executeMethod<String>(
      callMethod: () async {
        var news = newsRemoteDataSource.deleteNews(id: id);
        return news;
      },
    );
  }
}
