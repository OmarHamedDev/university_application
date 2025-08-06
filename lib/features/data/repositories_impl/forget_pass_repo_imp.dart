import 'package:dio/dio.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';

class ForgetPassRepoImp{
  final ServiceAPIs serviceAPIs;

  ForgetPassRepoImp(this.serviceAPIs);

  Future<Response> sendCode({required String email}){
    final response=serviceAPIs.sendCode(email: email);
    return response;
  }
  Future<Response> verifyCode({required String email,required String code}){
    final response=serviceAPIs.verifyCode(email: email, code: code);
    return response;
  }
  Future<Response> resetPass({required String email,required String code,required String pass,required String confirmPass}){
    final response=serviceAPIs.verifyCode(email: email, code: code);
    return response;
  }
}