import 'package:flutter/material.dart';

import '../../core/utils/constants/App_colors.dart';
import '../../core/widgets/buttons/next_button.dart';
import '../../core/widgets/buttons/text_form_field.dart';
import 'Verify_Password_Screen.dart';

class ForgetPasswordOne extends StatelessWidget {
  static const String routeName = 'forget';

  TextEditingController email = TextEditingController();

  ForgetPasswordOne({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * .11,
              ),
              Center(child: Image.asset("assets/images/amico.png",height: 250,width: 250,)),
              SizedBox(
                height: screenHeight * .06,
              ),
              Center(
                  child: Text(
                "Password recovery",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600,color: AppColors.babyBlue),
              )),
              Center(
                  child: Text(
                "Enter your email to recover your password",
                style: TextStyle(
                    color: AppColors.smallText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              )),
              SizedBox(
                height: screenHeight * .05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: CustomTextField(
                  label: Text("Enter your Gmail"),
                  suffix: Icon(Icons.email),
                  hintText: ' Example@gmail.com',
                  mycontroller: email,
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: screenHeight * .06,
              ),
              Center(
                  child: NextButton(onTap: () {
                    Navigator.pushNamed(context, VerifyPasswordScreen.routeName);
                  }, title: ' Recover password')),
            ],
          ),
        ],
      ),
    );
  }
}
