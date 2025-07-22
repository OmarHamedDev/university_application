// import 'package:injectable/injectable.dart';
// import '../../../../core/api/network/common/result.dart';
// import '../../../data/model/request/reset_password_request/reset_password_request.dart';
// import '../../entities/success_auth_entity.dart';
// import '../../repository/auth_repository.dart';
//
// @injectable
// class ResetPasswordUseCase{
//   final AuthRepository authRepository;
//   ResetPasswordUseCase({required this.authRepository});
//   Future<Result<SuccessAuthEntity>>invoke({required ResetPasswordRequest resetPasswordRequest})async{
//     return authRepository.resetPassword(resetPasswordRequest: resetPasswordRequest);
//   }
// }