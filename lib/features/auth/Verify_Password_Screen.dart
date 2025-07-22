import 'package:flutter/material.dart';
import 'package:hti_university_app_1/features/auth/reset_password.dart';
import '../../../../core/utils/constants/App_colors.dart';
import '../../core/widgets/buttons/next_button.dart';

class VerifyPasswordScreen extends StatelessWidget {
  static const routeName='verify';

  const VerifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(4, (index) {
                          return Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.babyBlue),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          );
                        }),
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
                          Navigator.pushNamed(context, ResetPassword.routeName);
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
  }
}
