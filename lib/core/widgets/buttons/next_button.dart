import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hti_university_app_1/features/presentation/login/view_model/login_cubit.dart';

import '../../utils/constants/App_colors.dart';

class NextButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const NextButton({ super.key, required this.onTap, required this.title,});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit,LoginState>(builder: (context, state) {
      return ElevatedButton(
        onPressed :state is LoginLoadingState?null:onTap,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(320, 48),
            backgroundColor:AppColors.babyBlue,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
        child: Center(
          child:state is LoginLoadingState?CircularProgressIndicator(
            color: AppColors.primary,
          ):Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    },);
  }
}
