import 'package:dio/dio.dart';
import 'package:hti_university_app_1/features/data/model/response/chat_response_model/answer_queston_response_model/answer_question_response_model.dart';
import 'package:hti_university_app_1/features/data/model/response/event_response_model/event_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart' show ParseErrorLogger;
import 'package:retrofit/http.dart';
import '../../../core/api/network/constants/api_constants.dart';
import '../../../core/api/network/constants/end_points.dart';
import '../model/request/create_single_use/create_single_use_request.dart';
import '../model/request/login_request/login_request.dart';
import '../model/request/register_request/register_request.dart';
import '../model/request/request_type_request/RequestTypeRequestModel.dart';
import '../model/response/admin_panding_response_model/admin_panding_response_model.dart';
import '../model/response/admin_student_request_reseponse_model/admin_student_request_response_model.dart';
import '../model/response/app_user_response_model/app_user_response_model.dart';
import '../model/response/chat_response_model/get_all_questions_response_model/get_all_questions_response_model.dart';
import '../model/response/get_all_student_request_response_model/get_all_student_request_response_model.dart';
import '../model/response/news_response_model/news_response_model.dart';
import '../model/response/request_type_response_model/request_type_response_model.dart';
import '../model/response/student_request_response_model/StudentRequestResponseModel.dart';

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
  Future<String> deleteNew(@Path("id") int id);

  @GET(EndPoints.events)
  Future<List<EventResponseModel>> getAllEvents();
  @DELETE("${EndPoints.events}/{id}")
  Future<String> deleteEvent(@Path("id") int id);
  @GET(EndPoints.adminStudentRequestsAccepted)
  Future<AdminStudentRequestResponseModel> getAllAcceptedRequestsAdmin();
  @GET(EndPoints.adminStudentRequestsPending)
  Future<AdminStudentRequestResponseModel> getAllPendingRequestsAdmin();
  @GET(EndPoints.adminStudentRequestsRejected)
  Future<AdminStudentRequestResponseModel> getAllRejectedRequestsAdmin();
  @GET("${EndPoints.adminStudentRequestsPending}/{id}")
  Future<AdminPandingResponseModel> getAllPendingRequestsAdminById(
    @Path("id") int id,
  );
  @PATCH("admin/student-requests/{id}/accept")
  Future<String> acceptRequest(
    @Path("id") int id,
    @Body() Map<String, dynamic> body,
  );
  @PATCH("admin/student-requests/{id}/reject")
  Future<String> rejectRequest(
    @Path("id") int id,
    @Body() Map<String, dynamic> body,
  );

  @GET(EndPoints.adminRequestsType)
  Future<RequestTypeResponseModel> getAllRequestsTypeAdmin();
  @POST(EndPoints.adminRequestsType)
  Future<String> addRequestType(
    @Body() RequestTypeRequestModel requestTypeRequestModel,
  );
  @DELETE("${EndPoints.adminRequestsType}/{id}")
  Future<String> deleteRequestType(@Path("id") int id);
  @PUT("${EndPoints.adminRequestsType}/{id}")
  Future<String> updateRequestType(
    @Path("id") int id,
    @Body() RequestTypeRequestModel requestTypeRequestModel,
  );
  @POST(EndPoints.logout)
  Future<String> logout();
  @DELETE(EndPoints.uploadPhoto)
  Future<String> deletePhoto();
  @GET(EndPoints.profile)
  Future<User> getProfile();


  @POST(EndPoints.events)
  @MultiPart()
  Future<String> createEvent(
    @Part(name: "image") List<MultipartFile> files,
    @Part(name: "title") String title,
    @Part(name: "description") String description,
    @Part(name: "start_time") String startTime,
  );

  @POST(EndPoints.uploadExcel)
  @MultiPart()
  Future<String> uploadExcel(@Part(name: "file") List<MultipartFile> files);
  @POST(EndPoints.createStudentUser)
  Future<String> createStudentUser(
    @Body() CreateSingleUseRequest createSingleUseRequest,
  );
  @POST(EndPoints.profileEdit)
  @MultiPart()
  Future<String> editProfile(@Part(name: "photo") List<MultipartFile> files);
  @DELETE(EndPoints.profileEdit)
  Future<String> deleteProfile();


  @POST(EndPoints.studentRequest)
  @MultiPart()
  Future<String> createStudentRequest(
      @Part(name: "receipt_image") List<MultipartFile> files,
      @Part(name: "request_id") int requestId,
      @Part(name: "count") int count,
      @Part(name: "student_name_ar") String studentNameAr,
      @Part(name: "student_name_en") String studentNameEn,
      @Part(name: "department") String department,
      @Part(name: "student_id") int studentId,
      );

  @GET(EndPoints.studentRequest)
  Future<Student_request_response_model>getAllRequestsStudent();

  @GET(EndPoints.request)
  Future<GetAllStudentRequestResponseModel> getAllRequestsTypeStudent();

  @GET(EndPoints.questions)
  Future<GetAllQuestionsResponseModel> getAllQuestions();
  @GET("${EndPoints.answer}/{id}")
  Future<AnswerQuestionResponseModel> getAnswer(@Path("id") int id);

}
