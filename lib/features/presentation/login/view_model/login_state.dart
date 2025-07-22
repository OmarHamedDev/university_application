part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class LoginFailuresState extends LoginState{
 final String errorMassage;
  LoginFailuresState({required this.errorMassage});
}


class NavigateToForgetPasswordScreenState extends LoginState{}
class NavigateToBaseScreenState extends LoginState{}
class NavigateToRegisterScreenState extends LoginState{}


class ChangePasswordVisibilityState extends LoginState{}