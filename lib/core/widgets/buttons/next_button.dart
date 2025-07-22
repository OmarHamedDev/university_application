import 'package:flutter/material.dart';

import '../../utils/constants/App_colors.dart';

class NextButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const NextButton({ super.key, required this.onTap, required this.title,});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed :onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(320, 48),
          backgroundColor:AppColors.babyBlue,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Center(
        child:Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
