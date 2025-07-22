import 'package:flutter/material.dart';

import '../../core/utils/constants/App_colors.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName='reset';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {

                      },
                      child: Text(
                        'Reset Password',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.babyBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
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
  }
}
