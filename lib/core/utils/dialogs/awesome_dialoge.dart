import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

showAwesomeDialog(
  BuildContext context, {
  required String title,
  bool dismiss = true,
  required String desc,
  required void Function() onOk,
  void Function()? onCancel, // Made onCancel optional
  required DialogType dialogType,
  String? buttonText,
}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    dismissOnTouchOutside: dismiss,
    btnOkText: buttonText ?? "Ok ", // اسم الزر
    btnCancelOnPress:
        onCancel != null
            ? () {
              FocusScope.of(context).unfocus();
              onCancel();
            }
            : null,
    btnOkOnPress: () {
      FocusScope.of(context).unfocus();
      onOk();
    },
  ).show();
}
