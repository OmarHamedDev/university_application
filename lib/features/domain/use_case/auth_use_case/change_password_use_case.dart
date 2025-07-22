// import 'package:hti_univerity/core/api/network/common/result.dart';
// import 'package:injectable/injectable.dart';
// import '../../../data/model/request/change_password_request/change_password_request.dart';
// import '../../repository/auth_repository.dart';
//
// @injectable
// class ChangePasswordUseCase{
//   final AuthRepository authRepository;
//   ChangePasswordUseCase({required this.authRepository});
//
//   Future<Result<bool>>invoke({required ChangePasswordRequest changePasswordRequest})async{
//     return await  authRepository.changePassword(changePasswordRequest: changePasswordRequest);
//   }
// }