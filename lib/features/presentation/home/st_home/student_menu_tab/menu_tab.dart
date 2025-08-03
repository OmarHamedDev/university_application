import 'package:flutter/material.dart';
import 'package:hti_university_app_1/core/extension/extension.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/menua/graduate/graduate.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/news/view/news_view.dart';
import '../../../login/view/log_in.dart';
import '../../../../home/std_home_tabs/menu_items/chat_bot.dart';
import '../event/view/event_student.dart';
import '../menua/request_student/view/my_requests.dart';
import '../profile/view/student_profile.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({super.key});
  Widget menuItem(String title, VoidCallback onTap,{Widget? widget,IconData? icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.96),
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
            icon==null?widget!:Icon(icon, size: 24, color: Colors.black87),
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // InkWell(
            //     onTap: () => Navigator.pop(context),
            //     child: Icon(Icons.arrow_back_ios)),
            SizedBox(),
            const Text('Menu',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
            Image.asset("assets/images/logo_9.png",width: 37,height: 37,)
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/logo_9.png"),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                menuItem('Profile page',  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentProfile(),));
                },icon: Icons.person,),
                menuItem('My Requests',  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyRequestsStudent(),));
                },icon: Icons.edit,),
                menuItem('Events',  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventStudent(),));
                },icon: Icons.event,),
                menuItem('New ',  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsView(),));
                },icon: Icons.newspaper,),
                // menuItem('Notifications', Icons.notifications_none, () {
                //   Navigator.pushNamed(context, NotificationTab.routeName);
                // }),
                menuItem('My-Chatbot', () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chatbot(),));
                },icon: Icons.message_outlined),
                menuItem('About graduate',  ()  {Navigator.pushNamed(context, GraduateScreen.routeName);},widget: Image.asset("assets/images/graduate.png")),
                menuItem('Log out', ()  {_goNextToLoginScreen(context);},
                icon: Icons.logout,
                ),
              ],
            ),
          ),
        ],
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
