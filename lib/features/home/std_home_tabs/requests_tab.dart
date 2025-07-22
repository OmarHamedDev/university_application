
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hti_university_app_1/features/home/std_home_tabs/requests/confirm_request.dart';

import '../../../core/utils/constants/App_colors.dart';

class RequestsTab extends StatelessWidget {
  final List<Map<String, dynamic>> requests = [
    {'title': 'English Graduation Certificate', 'price': 30},
    {'title': 'Recommendation Later', 'price': 50},
    {'title': 'Arabic Graduation Certificate', 'price': 70},
    {'title': 'English Equation for Subjects', 'price': 100},
    {'title': 'Proof of Registration', 'price': 30},
    {'title': 'Identify Card', 'price': 20},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
    {'title': 'Identify Card', 'price': 50},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Title
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Requests Page',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              // Question
              Text(
                'How can I request a Request ?',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 12),
              // List of requests
              Expanded(
                child: ListView.builder(
                  itemCount: 5,//requests.length,
                  itemBuilder: (context, index) {
                    final item = requests[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConfirmRequest(
                              title: item['title'],
                              count: 2,
                              price: item['price'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 12),
                          child: Row(
                            children: [
                              Icon(Icons.event_note_outlined, size: 28),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  item['title'],
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              Text(
                                '${item['price']} EG',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestDetailsPage extends StatelessWidget {
  final String title;

  const RequestDetailsPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: Text(
          'Details for "$title"',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
