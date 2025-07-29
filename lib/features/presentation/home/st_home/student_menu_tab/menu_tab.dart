import 'package:flutter/material.dart';
import 'package:hti_university_app_1/core/extension/extension.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/news/view/news_view.dart';
import '../../../login/view/log_in.dart';
import '../../../../home/std_home_tabs/menu_items/chat_bot.dart';
import '../../../../home/std_home_tabs/menu_items/documents.dart';
import '../../../../home/std_home_tabs/menu_items/profile.dart';
import '../../../../home/std_home_tabs/notification_tab.dart';
import '../event/view/event_student.dart';
import '../menua/request_student/view/my_requests.dart';
import '../profile/view/student_profile.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile(),));
            }),
            menuItem('My Requests', Icons.edit, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyRequestsStudent(),));
            }),
            menuItem('Events', Icons.event, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventStudent(),));
            }),
            menuItem('New ', Icons.newspaper, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewsView(),));
            }),
            // menuItem('Notifications', Icons.notifications_none, () {
            //   Navigator.pushNamed(context, NotificationTab.routeName);
            // }),
            menuItem('My-Chatbot', Icons.message_outlined, () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chatbot(),));
            }),
            menuItem('Log out', Icons.logout, ()  {
              _goNextToLoginScreen(context);
            }),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void _goNextToLoginScreen(BuildContext context) async {
    await context.appConfigProvider.logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LogInScreen.routeName,
          (route) => false,
    );
  }

}
