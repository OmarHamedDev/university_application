import 'package:flutter/material.dart';
import '../../../../core/utils/constants/App_colors.dart';

import '../../../core/utils/constants/App_colors.dart';
import 'add/add_new_events.dart';

class AdminEvents extends StatelessWidget {
  const AdminEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewEvents()));

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add new events',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: 5, // عدد العناصر التجريبية
              itemBuilder: (context, index) {
                return EventCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Frame 1268 (1).png', // غيّرها حسب مكان صورتك
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.red,
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: Text(
              "The institute’s Guide c....",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: Text(
              "To appreciate England earliest...",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/hti_logo.png',
                  height: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  "4:00pm    25/5/2025",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
