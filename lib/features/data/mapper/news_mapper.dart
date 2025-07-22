import 'package:hti_university_app_1/features/domain/entities/news_entity.dart';
import 'package:injectable/injectable.dart';

import '../model/response/news_response_model/news_response_model.dart';

abstract class NewsMapper {
  List<NewsEntity> mapNewsResponseModelToNewsEntity(
    List<NewsResponseModel> newsResponseModel,
  );
}

@Injectable(as: NewsMapper)
class NewsMapperImpl implements NewsMapper {
  @override
  List<NewsEntity> mapNewsResponseModelToNewsEntity(
    List<NewsResponseModel> newsResponseModel,
  ) {
    if (newsResponseModel.isEmpty) {
      return [];
    } else {
      return newsResponseModel
          .map(
            (e) => NewsEntity(
              id: e.id ?? 0,
              title: e.title ?? "",
              content: e.content ?? "",
              createdAt: e.createdAt ?? "",
              updatedAt: e.updatedAt ?? "",
            ),
          )
          .toList();
    }
  }
}
