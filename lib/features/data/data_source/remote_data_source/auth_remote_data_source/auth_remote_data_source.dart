import 'package:dio/dio.dart';

import '../../../../domain/entities/app_user_entity.dart';
import '../../../model/request/login_request/login_request.dart';
import '../../../model/request/register_request/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<(AppUserEntity, String? )> login(LoginRequest loginRequest);
  Future<(AppUserEntity, String? )> register(RegisterRequest registerRequest);
  Future<AppUserEntity>getAppUser();
  Future<String >deletePhoto();
  Future<String>updatePhoto(List<MultipartFile> photo);
  Future<String>logout();
}