import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/network/constants/api_constants.dart';
import '../../../core/caching/secure_storge/cache_keys.dart';
import '../../../core/caching/secure_storge/caching_Data.dart';
import '../../../dependency_inversion/di.dart';

@module
abstract class DioProvider {
  @lazySingleton
  Dio dioProvider() {
    final Dio dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "X-From": 'mobile'
        },
        connectTimeout: const Duration(seconds: ApiConstants.duration),
        sendTimeout: const Duration(seconds: ApiConstants.duration),
        receiveTimeout: const Duration(seconds: ApiConstants.duration),
      ),
    );
    dio.interceptors.add(providePretty());
    dio.interceptors.add(AppInterceptors());
    return dio;
  }

  @lazySingleton
  LogInterceptor providePretty() {
    return LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      request: true,
    );
  }
}





@lazySingleton
class AppInterceptors extends InterceptorsWrapper{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
   String ? token=await getIt.get<CachingDataSecureStorage>().readData(key:CacheKeys.token);
    if(token !=null){
     options.headers["Authorization"] = "Bearer $token";
     print("token $token");
   }
    super.onRequest(options, handler);
  }

}
