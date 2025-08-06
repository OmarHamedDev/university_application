import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/features/auth/Verify_Password_Screen.dart';
import 'package:hti_university_app_1/features/auth/reset_password.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/forget_pass_repo_imp.dart';
import 'package:hti_university_app_1/features/presentation/login/view/log_in.dart';
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
  final LoginUseCase? loginUseCase;
  final ForgetPassRepoImp? forgetPassRepoImp;
  LoginCubit({this.loginUseCase,this.forgetPassRepoImp}) : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
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

  );
  TextEditingController passwordController = TextEditingController
    (
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
    var result = await loginUseCase!.invoke(loginRequest: loginRequest);
    switch (result) {
      case Success<AppUserEntity>():
        emit(LoginSuccessState());
      case Failures<AppUserEntity>():
        emit(LoginFailuresState(
            errorMassage: ErrorHandler.formException(result.exception).errorMassage));
    }
  }
  Future<void> sendCode(BuildContext context,{required String email}) async {
    emit(LoginLoadingState());
    final result = await forgetPassRepoImp!.sendCode(email: email);
    Navigator.push(context,MaterialPageRoute(builder: (context) => VerifyPasswordScreen(email: email,)));
        emit(LoginSuccessState());
    }
  Future<void>verifyCode(BuildContext context,{required String email,required String code}) async {
    emit(LoginLoadingState());
    final result = await forgetPassRepoImp!.verifyCode(email: email, code: code);
    Navigator.push(context, MaterialPageRoute(builder:(context) => ResetPassword(email: email,code: code)));
        emit(LoginSuccessState());
    }
  Future<void>resetPass(BuildContext context,{required String email,required String code,required String pass,required String confirmPass}) async {
    emit(LoginLoadingState());
    final result = await forgetPassRepoImp!.resetPass(email: email, code: code, pass: pass, confirmPass: confirmPass);
    Navigator.pushNamedAndRemoveUntil(context,LogInScreen.routeName,(route) => false,);
        emit(LoginSuccessState());
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
