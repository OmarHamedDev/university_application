import 'package:flutter/material.dart';
import '../../presentation/login/view/log_in.dart';
import 'menu_items/chat_bot.dart';
import 'menu_items/documents.dart';
import 'menu_items/my_requests.dart';
import 'menu_items/profile.dart';
import 'notification_tab.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});
  Widget menuItem(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 8,
              offset: const Offset(4, 4),
            )
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void onTap(String title) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Menu',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            menuItem('Profile page', Icons.person, () {
              Navigator.pushNamed(context, Profile.routeName);
            }),
            menuItem('My Requests', Icons.edit, () {
              Navigator.pushNamed(context, MyRequests.routeName);
            }),
            menuItem('Documents library', Icons.folder_copy_outlined, () {
              Navigator.pushNamed(context, Documents.routeName);
            }),
            menuItem('Notifications', Icons.notifications_none, () {
              Navigator.pushNamed(context, NotificationTab.routeName);
            }),
            menuItem('My-Chatbot', Icons.message_outlined, () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chatbot(),));
            }),
            menuItem('Log out', Icons.logout, () {
              Navigator.pushNamed(context, LogInScreen.routeName);
            }),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
