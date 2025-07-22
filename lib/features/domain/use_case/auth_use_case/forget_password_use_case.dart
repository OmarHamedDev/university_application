// import 'package:injectable/injectable.dart';
// import '../../../../core/api/network/common/result.dart';
// import '../../../data/model/request/forget_password_password_request/forget_password_request.dart';
// import '../../entities/success_auth_entity.dart';
// import '../../repository/auth_repository.dart';
//
// @injectable
// class ForgetPasswordUseCase{
//   final AuthRepository authRepository;
//   ForgetPasswordUseCase({required this.authRepository});
//   Future<Result<SuccessAuthEntity>>invoke({required ForgetPasswordRequest forgetPasswordRequest})async{
//     return authRepository.forgetPassword(forgetPasswordRequest: forgetPasswordRequest);
//   }
// }