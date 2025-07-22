import 'package:flutter/material.dart';

class ErrorDialog {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
    String textButton = "OK, I Understand",
    required Function()? onPressed,
    String title = "⚠️ Error Occurred!",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // أيقونة الخطأ
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent.withOpacity(0.1),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.error_outline_rounded,
                    size: 60,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "⚠️ Error Occurred!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.redAccent,
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed ?? () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      textButton,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
