import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/api/network/common/result.dart';
import '../../../../core/api/network/error/error_handler.dart';
import '../../../data/model/request/login_request/login_request.dart';
import '../../../domain/entities/app_user_entity.dart';
import '../../../domain/use_case/auth_use_case/login_use_case.dart';
import 'login_action.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> doAction(LoginAction loginActionView) async {
    switch (loginActionView) {
      case ButtonLoginAction():
        return await _login();
      case NavigateToForgetPasswordScreenAction():
        return _navigateToForgetPasswordScreen();
      case NavigateToBaseScreenAction():
        return _navigateToBaseScreen();
      case NavigateToRegisterScreenAction():
        return _navigateToRegisterScreen();
      case ChangePasswordVisibilityAction():
        return _changePasswordVisibility();
    }
  }

  ///Admin
  // admin :  "admin@gmail.com"
  // password : "12345 "

   ///Student
  //student42025001@university.edu.eg / 10102007
  // Techer
  //test2@gmail.com / 3322
  TextEditingController emailController = TextEditingController
    (
    text: "student42025001@university.edu.eg"
  );
  TextEditingController passwordController = TextEditingController
    (
    text: "10102007 "
  );
  GlobalKey<FormState>formKey=GlobalKey<FormState>();




  bool _isPasswordVisible = true;
  bool get isPasswordVisible => _isPasswordVisible;
  void _changePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(ChangePasswordVisibilityState());
  }


  Future<void> _login() async {
    emit(LoginLoadingState());
    LoginRequest loginRequest = LoginRequest(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    var result = await loginUseCase.invoke(loginRequest: loginRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(LoginSuccessState());
      case Failures<AppUserEntity>():
        emit(LoginFailuresState(
            errorMassage: ErrorHandler.formException(result.exception).errorMassage));
    }
  }

  void _navigateToRegisterScreen() {
    emit(NavigateToRegisterScreenState());
  }

  void _navigateToBaseScreen() {
    emit(NavigateToBaseScreenState());
  }

  void _navigateToForgetPasswordScreen() {
    emit(NavigateToForgetPasswordScreenState());
  }
}
