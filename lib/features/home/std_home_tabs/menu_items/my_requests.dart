import 'package:flutter/material.dart';
import '../../../../core/utils/constants/App_colors.dart';

class MyRequests extends StatefulWidget {
  static const String routeName = 'myRequest';

  const MyRequests({super.key});

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("My Requests",style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),),
      ),
    );
  }
}
