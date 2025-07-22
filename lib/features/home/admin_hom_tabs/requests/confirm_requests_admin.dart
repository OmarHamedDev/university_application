import 'package:flutter/material.dart';
import '../../../../core/utils/constants/App_colors.dart';
import 'Reject_Reason.dart';

class ConfirmRequestsAdmin extends StatelessWidget {
  static const String routeName='conf';
  // بيانات مؤقتة للتصميم
  final int requestNumber = 58;
  final String requestDescription = "Proof of registration arabic";
  final int requestCount = 2;
  final double requestPrice = 50.00;
  final double requestTotalPrice = 100.00;
  final String requestDate = "2025.06.02T10;38;01.000Z";
  final String requestStatus = "Pending";

  final String studentArabicName = "عبدالرحمن حسن سليمان";
  final String studentEnglishName = "Abdelrhman hassan";
  final String studentStatus = "student";
  final String studentId = "42021357";
  final String studentEmail = "42021357@hti.edu.eg";

  final List<String> imageUrls = [
    "https://via.placeholder.com/300x200", // صورة مؤقتة
    "https://via.placeholder.com/300x200"
  ];

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: Text("$title:", style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text("Confirm Your Request"),
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Requests Information:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    buildInfoRow("Requests Number", requestNumber.toString()),
                    buildInfoRow("Requests Description", requestDescription),
                    buildInfoRow("Requests Count", requestCount.toString()),
                    buildInfoRow("Requests Price", requestPrice.toStringAsFixed(2)),
                    buildInfoRow("Requests Total Price", requestTotalPrice.toStringAsFixed(2)),
                    buildInfoRow("Requests Date", requestDate),
                    buildInfoRow("Requests Status", requestStatus),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Student Information:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    buildInfoRow("Student Arabic Name", studentArabicName),
                    buildInfoRow("Student English Name", studentEnglishName),
                    buildInfoRow("Student Status", studentStatus),
                    buildInfoRow("Student ID", studentId),
                    buildInfoRow("Student Email", studentEmail),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text("Requests Images:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("press on the photo to see it in fullscreen."),
            SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // هنا ممكن تضيف fullscreen لاحقًا
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(imageUrls[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // تنفيذ القبول
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.babyBlue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Accept", style: TextStyle(fontSize: 16,color: Colors.white)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(RejectReason.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Reject", style: TextStyle(fontSize: 16,color: Colors.white)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
