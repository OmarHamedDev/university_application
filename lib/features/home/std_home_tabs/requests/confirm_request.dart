import 'package:flutter/material.dart';

import '../../../../core/utils/constants/App_colors.dart';
import '../../../../core/widgets/buttons/next_button.dart';

class ConfirmRequest extends StatelessWidget {
  static const String routeName = 'confirm';

  final String title;
  final int count;
  final int price;

  ConfirmRequest({
    required this.title,
    this.count = 2,
    this.price = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          surfaceTintColor: AppColors.secondary,
          title: Text("Confirm Your Request"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: ListView(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Request Info Box
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("R.Description:  $title"),
                          SizedBox(height: 6),
                          Text("R.Count:       $count  <->"),
                          SizedBox(height: 6),
                          Text("R.Total Price: $price"),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Warning Text
                    Text(
                      'Hint your must deliver to the institute 6 photos 4*6\ncome to institute by self to take the certificate',
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Student Information:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: Text("Edit",
                              style: TextStyle(color: Colors.blue)),
                        )
                      ],
                    ),
                    // Input Fields
                    _buildInput("English Name:"),
                    _buildInput("Arabic Name:"),
                    _buildInput("Department:"),
                    _buildInput("Statues:"),
                    _buildInput("ID:"),
                    SizedBox(height: 10),
                    // Upload Button
                    SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: NextButton(
                            onTap: () {}, title: 'Upload The reset')),
                    SizedBox(height: 10),
                    // Placeholder Box
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Send Button
                    SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: NextButton(onTap: () {}, title: 'sent')),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildInput(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
