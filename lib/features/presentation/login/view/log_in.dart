import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/extension/extension.dart';
import 'package:hti_university_app_1/dependency_inversion/di.dart';

import '../../../../core/utils/constants/App_colors.dart';
import '../../../../core/utils/dialogs/awesome_dialoge.dart';
import '../../../../core/utils/dialogs/loading_dialog.dart';
import '../../../../core/widgets/buttons/next_button.dart';
import '../../../../core/widgets/buttons/text_form_field.dart';
import '../../../home/std_home_screen.dart';
import '../../../auth/forget_password_one.dart';
import '../view_model/login_action.dart';
import '../view_model/login_cubit.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = 'login';

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var loginViewModel = getIt.get<LoginCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          _handleBlocListenerLoginState(state);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: loginViewModel.formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Higher Technology Inistiute",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: AppColors.babyBlue,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/SplashScreen.png",
                        height: 300,
                        width: 300,
                      ),
                    ),
                    CustomTextField(
                      label: Text("Enter your Email"),
                      suffix: Icon(Icons.person),
                      hintText: "email@gmail.com",
                      mycontroller: loginViewModel.emailController,
                      obscureText: false,
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      label: Text("Enter your password"),
                      suffix: Icon(Icons.remove_red_eye_outlined),
                      hintText: "********",
                      mycontroller: loginViewModel.passwordController,
                      obscureText: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0, right: 14),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ForgetPasswordOne.routeName,
                              );
                            },
                            child: Column(
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  "Forgot password ?",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    NextButton(
                      onTap: () {
                        loginViewModel.doAction(ButtonLoginAction());
                      },
                      title: "Login",
                    ),
                    // SizedBox(height: 25),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed("admin");
                    //   },
                    //   child: RichText(
                    //     text: TextSpan(
                    //       text: "move to ", // First part
                    //       style: TextStyle(
                    //         color: Colors.grey,
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: 'Admin', // Second part
                    //           style: TextStyle(
                    //             color: AppColors.primary,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w500,
                    //           ), // Different color
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic _handleBlocListenerLoginState(LoginState state) {
    if (state is LoginLoadingState) {
      LoadingDialog.showLoadingDialog(context);
    } else if (state is LoginSuccessState) {
      LoadingDialog.hideLoadingDialog(context);
      loginViewModel.doAction(NavigateToBaseScreenAction());
    } else if (state is LoginFailuresState) {
      LoadingDialog.hideLoadingDialog(context);
      showAwesomeDialog(
        context,
        title: "Error",
        desc: state.errorMassage,
        onOk: () {},
        dialogType: DialogType.error,
      );
    } else if (state is NavigateToBaseScreenState) {
      print("navigate to base screen");
      return _goNextToBaseScreen();
    }
  }

  void _goNextToBaseScreen() async {
    await context.appConfigProvider.initializeAppConfig();
    var initialRoute = context.appConfigProvider.getInitialPageRouteName();
    Navigator.pushNamedAndRemoveUntil(context, initialRoute, (route) => false);
  }
}
