import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const String routeName = 'profile';

  final String coverImagePath = 'assets/images/Frame 1268 (1).png';
  final String profileImagePath = 'assets/images/Ellipse 1.png';
  final String name = 'Abdelrhman hassan soliman';
  final String major = 'Computer science';
  final String email = '42021357@hti.edu.eg';
  final String phone = '01013775184';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        leading: const BackButton(color: Colors.black,),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(coverImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 46,
                          backgroundImage: AssetImage(profileImagePath),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.camera_alt, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                major,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'General info:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.edit, size: 20),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(email, style: const TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(width: 12),
                  Text(phone, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
