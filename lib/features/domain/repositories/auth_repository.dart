
import '../../../core/api/network/common/result.dart';
import '../../data/model/request/login_request/login_request.dart';
import '../entities/app_user_entity.dart';

abstract class AuthRepository {
  Future<Result<AppUserEntity>> login({required LoginRequest loginRequest});
  // Future<Result<AppUserEntity>> register({required RegisterRequest registerRequest});
  // Future<Result<bool>> changePassword({required ChangePasswordRequest changePasswordRequest});
  // Future<Result<SuccessAuthEntity>>forgetPassword({required ForgetPasswordRequest forgetPasswordRequest});
  // Future<Result<SuccessAuthEntity>>resetPassword({required ResetPasswordRequest resetPasswordRequest});
  // Future<Result<SuccessAuthEntity>>verifyResetCode({required VerifyResetCodeRequest verifyRestCode});
  // Future<Result<bool>>logOut();
}