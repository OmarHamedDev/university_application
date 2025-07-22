import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/data/model/response/event_response_model/event_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart' show ParseErrorLogger;
import 'package:retrofit/http.dart';
import '../../../core/api/network/constants/api_constants.dart';
import '../../../core/api/network/constants/end_points.dart';
import '../model/request/login_request/login_request.dart';
import '../model/response/app_user_response_model/app_user_response_model.dart';
import '../model/response/news_response_model/news_response_model.dart';

part 'api_manger.g.dart';

@injectable
@singleton
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManger {
  @factoryMethod
  factory ApiManger(Dio dio) = _ApiManger;

  @POST(EndPoints.login)
  Future<AppUserResponseModel> login(@Body() LoginRequest loginRequest);

  @GET(EndPoints.news)
  Future<List<NewsResponseModel>> getAllNews();

  @POST(EndPoints.news)
  @MultiPart()
  Future<String> addNews(
      @Part(name: "title") String title,
      @Part(name: "content") String content,
      );
  @DELETE("${EndPoints.news}/{id}")
  Future<String> deleteNew(
      @Path("id") int id,
      );
  @GET(EndPoints.events)
  Future<List<EventResponseModel>> getAllEvents();

  // Future<String> addEvent(
  //     @Part(name: "title") String title,
  //     @Part(name: "content") String content,
  //     );
  // @DELETE("${EndPoints.news}/{id}")
  // Future<String> deleteEvent(
  //     @Path("id") int id,
  //     );
}
