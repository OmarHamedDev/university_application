import 'package:hti_university_app_1/features/data/model/response/news_response_model/news_response_model.dart';
import 'package:hti_university_app_1/features/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_manger.dart';
import '../../../mapper/news_mapper.dart';
import 'news_remote_data_source.dart';

@Injectable(as:NewsRemoteDataSource )
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiManger _apiManger;
  final NewsMapper _newsMapper;
  NewsRemoteDataSourceImpl(this._apiManger, this._newsMapper);
  @override
  Future<List<NewsEntity>> getAllNews() async {
    var news = await _apiManger.getAllNews();
    return _newsMapper.mapNewsResponseModelToNewsEntity(news);
  }

  @override
  Future<String> createNews({required String title, required String content}) async{
     await _apiManger.addNews(title, content);
    return "Success";
  }

  @override
  Future<String> deleteNews({required int id})async {
    await _apiManger.deleteNew(id);
    return "Success";
  }
}
