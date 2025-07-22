import 'package:flutter/material.dart';

import '../../utils/constants/App_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController mycontroller;
  final bool obscureText;
  final Widget suffix;
  final Widget label;
  final  String? Function(String?)? validator;

   const CustomTextField(
      {super.key,
        this.validator,
      required this.label,
      required this.suffix,
      required this.hintText,
      required this.mycontroller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: mycontroller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: AppColors.primary),
          ),
          label: label,
          labelStyle: TextStyle(color: Colors.grey),
          suffix: suffix,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
