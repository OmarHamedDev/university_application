import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';
import 'package:hti_university_app_1/features/auth/reset_password.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/forget_pass_repo_imp.dart';
import 'package:hti_university_app_1/features/presentation/login/view_model/login_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../core/utils/constants/App_colors.dart';
import '../../core/widgets/buttons/next_button.dart';

class VerifyPasswordScreen extends StatelessWidget {
  static const routeName='verify';
  final StreamController<ErrorAnimationType> errorAnimationController=StreamController();
   final TextEditingController pinCode=TextEditingController();
   final String? email;
    VerifyPasswordScreen({super.key,  this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginCubit(forgetPassRepoImp: ForgetPassRepoImp(ServiceAPIs(Dio()))),
    child: BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/bro.png',
                        height: 250,
                        width: 250,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Verify Password",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color:AppColors.babyBlue ,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Please enter the 4 digit code sent to\nyouremail@gmail.com",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.smallText),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 56),
                        child: Directionality(
                          textDirection: TextDirection.ltr, // Force LTR
                          child: PinCodeTextField(
                            appContext: context,
                            controller: pinCode,
                            hintCharacter: "-",
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                            ),
                            length: 4,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.slide,
                            errorAnimationDuration: 1,
                            textStyle:  TextStyle(
                              color: Color(0xFF2E637F),
                              fontSize: 24,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            ),
                            cursorColor: Colors.blue,
                            onChanged: (p0) {},
                            pinTheme: PinTheme(
                              errorBorderColor: Colors.red,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: const Color(0x192E637F),
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(12),
                              fieldHeight: 65
                              ,
                              fieldWidth: 55,
                              activeColor: const Color(0x192E637F),
                              inactiveColor: const Color(0x192E637F),
                              activeFillColor: Colors.white,
                              selectedColor: AppColors.primary,
                              borderWidth:1,
                            ),
                            animationDuration: const Duration(milliseconds: 200),
                            enableActiveFill: true,
                            errorAnimationController: errorAnimationController,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {},
                        child:  RichText(
                          text: TextSpan(
                            text: "I didn’t get a code! ", // First part
                            style: TextStyle(
                                color: AppColors.smallText,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Resend code', // Second part
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400), // Different color
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: NextButton(onTap: (){
                             LoginCubit.get(context).verifyCode(context, email: email!, code: pinCode.text);
                            }, title: "Verify Password")
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },),
    );
  }
}
