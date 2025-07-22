import 'package:flutter/material.dart';

import '../../../../core/utils/constants/App_colors.dart';

class Documents extends StatefulWidget {
  static const String routeName = 'docs';

  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Documets library",style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),),
      ),
    );
  }
}
