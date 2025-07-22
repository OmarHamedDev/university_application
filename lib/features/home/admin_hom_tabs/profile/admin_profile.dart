import 'package:flutter/material.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// غلاف + صورة البروفايل
            Stack(
              clipBehavior: Clip.none,
              children: [
                /// الغلاف
                Image.asset(
                  'assets/images/Frame 1268 (1).png',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),

                /// صورة البروفايل
                Positioned(
                  bottom: -50,
                  left: width / 2 - 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 46,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),

            /// الاسم
            Text(
              "Ahmed mohamed",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            /// شارة الدور
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Admin Computer science",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 30),

            /// عنوان المعلومات + زر تعديل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    "General info:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.edit, size: 20),
                ],
              ),
            ),
            SizedBox(height: 20),

            /// معلومات الإيميل
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.email_outlined, color: Colors.black),
                  SizedBox(width: 12),
                  Text(
                    "@hti.edu.eg",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            /// معلومات الهاتف
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
              child: Row(
                children: [
                  Icon(Icons.phone_outlined, color: Colors.black),
                  SizedBox(width: 12),
                  Text(
                    "01013757518",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
