import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/core/api/addition/serviceApi.dart';
import 'package:hti_university_app_1/features/data/repositories_impl/forget_pass_repo_imp.dart';
import 'package:hti_university_app_1/features/presentation/login/view_model/login_cubit.dart';

import '../../core/utils/constants/App_colors.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName='reset';
  final String? email;
  final String? code;
  final TextEditingController pass=TextEditingController();
  final TextEditingController confirmPass=TextEditingController();

   ResetPassword({super.key, this.email, this.code});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: LoginCubit(forgetPassRepoImp: ForgetPassRepoImp(ServiceAPIs(Dio()))),
    child: BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/reset_password.png', // ضع الصورة هنا
                        height: 200,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Create New Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                      SizedBox(height: 40),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('New Password',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        obscureText: _obscureNewPassword,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureNewPassword = !_obscureNewPassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Confirm Password',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 8),
                      TextField(
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword = !_obscureConfirmPassword;
                              });
                            },
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed:state is LoginLoadingState?null: () {
                            LoginCubit.get(context).resetPass(context, email: widget.email!, code: widget.code!, pass: widget.pass.text, confirmPass: widget.confirmPass.text);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.babyBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Center(
                            child:state is LoginLoadingState?CircularProgressIndicator(
                              color: AppColors.primary,
                            ): Text(
                              'Reset Password',
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
      );
    },),
    );
  }
}
