import 'package:flutter/material.dart';
import '../../../../core/utils/constants/App_colors.dart';
import '../add/add_request.dart';

class ManageRequests extends StatelessWidget {
  const ManageRequests({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> requests = [
      {'title': 'English Graduation Certification', 'price': 50, 'currency': 'EG'},
      {'title': 'Recommendation Later', 'price': 50, 'currency': 'EG'},
      {'title': 'English Graduation Certification', 'price': 50, 'currency': 'EG'},
      {'title': 'English Graduation Certification', 'price': 50, 'currency': 'EG'},
      {'title': 'English Graduation Certification', 'price': 50, 'currency': 'EG'},
      {'title': 'English Graduation Certification', 'price': 50, 'currency': 'EG'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mange requests',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// الزرين في الأعلى
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddRequests(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add new requests',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Update requests'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            /// القائمة
            Expanded(
              child: ListView.separated(
                itemCount: requests.length,
                separatorBuilder: (_, __) => SizedBox(height: 20),
                itemBuilder: (context, index) {
                  final item = requests[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, size: 28),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          "${item['price']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Text(
                          item['currency'],
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
