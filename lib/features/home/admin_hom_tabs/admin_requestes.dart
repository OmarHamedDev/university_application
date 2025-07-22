import 'package:flutter/material.dart';
import 'package:hti_university_app_1/features/home/admin_hom_tabs/requests/confirm_requests_admin.dart';
import '../../../../core/utils/constants/App_colors.dart';

class AdminRequests extends StatelessWidget {
  final List<RequestModel> requests = List.generate(
    6,
        (index) => RequestModel(
      title: "Proof of Registration",
      date: "22/10/2024",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
            child: Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.event_note_outlined, size: 24),
                title: Text(request.title, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(request.date),
                onTap: () {
                  Navigator.of(context).pushNamed(ConfirmRequestsAdmin.routeName);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class RequestModel {
  final String title;
  final String date;

  RequestModel({required this.title, required this.date});
}
