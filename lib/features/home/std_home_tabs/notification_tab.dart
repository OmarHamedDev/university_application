import 'package:flutter/material.dart';

import '../../../core/utils/constants/App_colors.dart';

class NotificationTab extends StatelessWidget {
  static const String routeName='notifi';
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:AppColors.secondary,
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(child: Image.asset("assets/images/carbon_notification-filled.png")),
            SizedBox(height: 10,),
            Text("No Notification yet",style: TextStyle(
              fontSize: 22,

            ),)
          ],
        )
    );
  }
}
