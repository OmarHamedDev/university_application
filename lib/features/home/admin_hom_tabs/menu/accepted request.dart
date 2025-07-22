import 'package:flutter/material.dart';

class AcceptedRequests extends StatelessWidget {
  const AcceptedRequests({super.key});

  @override
  Widget build(BuildContext context) {
    // دي مجرد بيانات تجريبية – لاحقًا هتستبدل بداتا حقيقية
    final List<String> acceptedRequests = List.generate(
      4,
          (index) => 'English Graduation Certificate',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Accepted requests',
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
      
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: acceptedRequests.length,
          separatorBuilder: (_, __) => const SizedBox(height: 30),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [

                  Icon(Icons.calendar_month_outlined, size: 22),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      acceptedRequests[index],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(Icons.check, size: 24, color: Colors.green),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
