import 'package:flutter/material.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/home_tab/view/home_tab.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/student_menu_tab/menu_tab.dart';
import 'package:hti_university_app_1/features/home/std_home_tabs/notification_tab.dart';
import 'package:hti_university_app_1/features/presentation/home/st_home/st_request/view/requests_tab.dart';

import '../../core/utils/constants/App_colors.dart';

class StdHomeScreen extends StatefulWidget {
  static const String routeName = 'std';

  const StdHomeScreen({super.key});

  @override
  State<StdHomeScreen> createState() => _StdHomeScreenState();
}

class _StdHomeScreenState extends State<StdHomeScreen> {
  int selectedIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    RequestsTab(),
   // NotificationTab(),
   MenuTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: selectedIndex,
              children: tabs,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  selectedItemColor: AppColors.babyBlue,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 9,
                  unselectedFontSize: 9,
                  currentIndex: selectedIndex,
                  onTap: (index) => setState(() => selectedIndex = index),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined, size: 20), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_box_outlined, size: 20), label: "Requests"),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.notifications_outlined, size: 20), label: "Notification"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu, size: 20), label: "Menu"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
