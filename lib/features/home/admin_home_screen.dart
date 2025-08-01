import 'package:flutter/material.dart';
import 'package:hti_university_app_1/core/extension/extension.dart';
import 'package:hti_university_app_1/features/presentation/home/ad_home/menu_tab/create_single_user/view/create_single_user.dart';

import '../../core/utils/constants/App_colors.dart';
import '../presentation/home/ad_home/menu_tab/upload_sheet/view/update sheet.dart';
import '../presentation/login/view/log_in.dart';
import 'admin_hom_tabs/admin_decomantion.dart';
import '../presentation/home/ad_home/event_tab/view/admin_events.dart';
import '../presentation/home/ad_home/news_tab/view/admin_news.dart';
import '../presentation/home/ad_home/requests/view/admin_requestes.dart';
import '../presentation/home/ad_home/menu_tab/accepted_request/view/accepted request.dart';
import '../presentation/home/ad_home/menu_tab/manage_request/view/manage request.dart';
import '../presentation/home/ad_home/menu_tab/rejected_request/view/rejected request.dart';
import '../presentation/home/ad_home/profile/view/admin_profile.dart';

class AdminHomeScreen extends StatefulWidget {
  static const String routeName = 'admin';

  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int selectedIndex = 0;

  final List<Widget> admin = [
    AdminRequests(),
    NewsScreen(),
    AdminEvents(),
    AdminDocumentation(),
  ];

  void _showAdminMenu() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Align(
          alignment: Alignment.centerRight,
          child: FractionallySizedBox(
            widthFactor: 0.75,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          BackButton(),
                          SizedBox(width: 8),
                          Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),

                    /// Menu Items
                    _buildMenuItem(
                      Icons.add_box_outlined,
                      'Manage request',
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ManageRequests(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.check_circle_outline,
                      'Accepted request',
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AcceptedRequests(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(
                      Icons.cancel_outlined,
                      'Rejected request',
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RejectedRequests(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(Icons.update, 'Update Sheet', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateSheetView(),
                        ),
                      );
                    }),
                    _buildMenuItem(Icons.update, 'Create User', () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateSingleUser(),
                        ),
                      );
                    }),

                    SizedBox(height: 50),

                    /// Logout
                    _buildMenuItem(Icons.logout, 'Logout', () {
                      _goNextToLoginScreen(context); // تسجيل الخروج
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AdminProfile()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu_outlined, color: Colors.black),
            onPressed: _showAdminMenu,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: selectedIndex, children: admin),
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
                data: Theme.of(context).copyWith(canvasColor: Colors.white),
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
                      icon: Icon(Icons.add_box_outlined, size: 20),
                      label: "Requests",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book_outlined, size: 20),
                      label: "News",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_today_rounded, size: 20),
                      label: "Events",
                    ),
                    // BottomNavigationBarItem(
                    //   icon: Icon(Icons.book_outlined, size: 20),
                    //   label: "Documentation",
                    // ),
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
