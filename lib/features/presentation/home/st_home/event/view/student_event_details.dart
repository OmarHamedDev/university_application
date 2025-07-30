import 'package:flutter/material.dart';

class StudentEventDetails extends StatefulWidget {
  const StudentEventDetails({super.key});

  @override
  State<StudentEventDetails> createState() => _StudentEventDetailsState();
}

class _StudentEventDetailsState extends State<StudentEventDetails> {

  List<String>images = [
    "assets/images/event_1.png",
    "assets/images/event_2.png",
    "assets/images/event_3.png",
    "assets/images/event_4.png",
    "assets/images/event_5.png",
    "assets/images/event_6.png",
    "assets/images/event_7.png",
    "assets/images/event_8.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Alumni Forum',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8
          ),
          itemBuilder: (context, index) {
            return Image.asset(
              height: 163,
              fit: BoxFit.cover,
              width: double.infinity,
               images[index],
               );
          },),
    )
    );
   }
}
