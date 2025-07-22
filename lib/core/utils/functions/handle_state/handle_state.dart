import 'package:flutter/material.dart';
import '../../../api/network/error/error_handler.dart';

class HandleState {
  static Widget loading() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  }

  static Widget error(Exception exception ,BuildContext context) {
    final errorModel=ErrorHandler.formException(exception);
    if(errorModel.code==401){
      return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(AppImages.errorIcon,
                //   width: 300.w,
                //   height: 200.h,
                //   fit: BoxFit.cover,
                // ),
               // verticalSpace(20),
                Text(
                  "Your session has expired. Please log in again.",
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
               // verticalSpace(30),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login screen
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      "/login",
                      (route) => false,

                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(,
              //   width: 300.w,
              //   height: 200.h,
              //   fit: BoxFit.cover,
             // ),
           //   verticalSpace(20),
              Text(
                errorModel.errorMassage,
                textAlign: TextAlign.center,
                maxLines: 3,
                style:
               TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  static Widget emptyList({
    double paddingTop = 100,
    required Widget child, required List list, String message = "Empty List"}) {
    if (list.isEmpty) {
      return Center(child: empty(message: message,paddingTop: paddingTop));
    } else {
      return child;
    }
  }

 static Widget empty({
    required String message,
   double paddingTop = 100
  }) {
    return Padding(
      padding:  EdgeInsets.only(top:paddingTop),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Icon(
           Icons.list,
           size: 200,
           color: Colors.grey,
         ),
          Text(
            message,
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ],
      ),
    );
  }

// return Center(
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Icon(icon, color: Colors.blueAccent, size: size),
    //       const SizedBox(height: 12),
    //       Text(
    //         message,
    //         style: TextStyle(
    //           color: AppColors.kPrimary,
    //           fontSize: 18.sp,
    //         ),
    //         textAlign: TextAlign.center,
    //       ),
    //     ],
    //   ),
    // );
  }

