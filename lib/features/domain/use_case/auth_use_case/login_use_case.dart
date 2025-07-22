import 'package:injectable/injectable.dart';

import '../../../../core/api/network/common/result.dart';
import '../../../data/model/request/login_request/login_request.dart';
import '../../entities/app_user_entity.dart';
import '../../repositories/auth_repository.dart';

@injectable
class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Result<AppUserEntity>> invoke({
    required LoginRequest loginRequest,
  }) async {
    return _authRepository.login(loginRequest: loginRequest);
  }
}
