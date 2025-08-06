import 'package:dio/dio.dart';
import '../../../dependency_inversion/di.dart';
import '../../caching/secure_storge/cache_keys.dart';
import '../../caching/secure_storge/caching_Data.dart';
import '../network/constants/end_points.dart';
class ServiceAPIs{
  final Dio dio;

  ServiceAPIs(this.dio);

  Future<Response> notification() async {
    String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
    final response = dio.get(
       EndPoints.notification,
      options: Options(
      method: "GET",
      headers: {
        "Authorization":"Bearer $token",
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  Future<Response> graduates() async {
    String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
    final response = dio.get(
       EndPoints.graduate,
      options: Options(
      method: "GET",
      headers: {
        "Authorization":"Bearer $token",
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  Future<Response> graduateById({required String id}) async {
    String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
    final response = dio.get(
       "${EndPoints.graduate}/$id",
      options: Options(
      method: "GET",
      headers: {
        "Authorization":"Bearer $token",
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  Future<Response> sendCode({required String email}) async {
    final response = dio.post(
       EndPoints.pass,
      data: {
         "email":email
      },
      options: Options(
      method: "POST",
      headers: {
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  Future<Response> verifyCode({required String email,required String code}) async {
    final response = dio.post(
       EndPoints.pass,
      data: {
         "email":email
      },
      options: Options(
      method: "POST",
      headers: {
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  Future<Response> resetPass({required String email,required String code,required String pass,required String confirmPass}) async {
    final response = dio.post(
       EndPoints.resetPass,
      data: {
         "email":email,
         "code":code,
         "password":pass,
         "password_confirmation":confirmPass,
      },
      options: Options(
      method: "POST",
      headers: {
        "Accept": "application/json", "type": "text"},

      ),
    );
    return response;
  }
  // Future<Response> geteventById({required String id}) async {
  //   String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
  //   final response = dio.get(
  //     "${EndPoints.graduate}/$id",
  //     options: Options(
  //       method: "GET",
  //       headers: {
  //         "Authorization":"Bearer $token",
  //         "Accept": "application/json", "type": "text"},
  //
  //     ),
  //   );
  //   return response;
  // }

}
