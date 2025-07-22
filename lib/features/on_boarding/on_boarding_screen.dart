import 'package:flutter/material.dart';

import '../presentation/login/view/log_in.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'OnBoarding';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  final List<String> images = [
    'assets/images/Image (1).png',
    'assets/images/rafiki.png',
    'assets/images/image 3.png',
  ];

  final List<String> titles = [
    'From study guides to smart schedules all designed to help you stay focused and organized',
    'Connect with fellow students, ask questions, share knowledge, and grow together.',
    'Your Path to Graduation, Made Simple With Maahad, every step of your academic journey is guided.',
  ];

  int currentPage = 0;

  void nextPage() {
    if (currentPage < images.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, LogInScreen.routeName);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        height: height * 0.5,
                        width: width * 0.5,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: height * 0.04),
                      Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                      ElevatedButton(
                        onPressed: nextPage,
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(18),
                          backgroundColor: Colors.blue,
                        ),
                        child: Icon(
                          currentPage == images.length - 1
                              ? Icons.check
                              : Icons.arrow_forward,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: height * 0.02,
              right: width * 0.05,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LogInScreen.routeName);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
