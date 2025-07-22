import 'package:injectable/injectable.dart';

import '../../../../domain/entities/app_user_entity.dart';
import '../../../api/api_manger.dart';
import '../../../mapper/auth_mapper.dart';
import '../../../model/request/login_request/login_request.dart';
import '../../../model/request/register_request/register_request.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManger _apiManger;
  final AuthMapper _authMapper;
  AuthRemoteDataSourceImpl(this._apiManger, this._authMapper);
  @override
  Future<(AppUserEntity, String?)> login(LoginRequest loginRequest) async {
    var appUserModel = await _apiManger.login(loginRequest);
    return (
      _authMapper.mapAppUserModelToEntity(appUserModel),
      appUserModel.token
    );
  }

  @override
  Future<(AppUserEntity, String?)> register(RegisterRequest registerRequest)async {
    var appUserModel = await
    _apiManger.login(LoginRequest(
      email: registerRequest.email,
      password: registerRequest.password,
    ));
    return (
    _authMapper.mapAppUserModelToEntity(appUserModel),
    appUserModel.token
    );
  }
}
