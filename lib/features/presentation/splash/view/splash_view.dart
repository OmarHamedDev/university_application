import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/routes/app_page_route_provider.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateAfterDelay();
    });
  }

  Future<void> _navigateAfterDelay() async {
    final appConfigProvider = Provider.of<AppConfigProvider>(context, listen: false);
    await Future.delayed(const Duration(seconds: 3));
    await appConfigProvider.initializeAppConfig();
    final route = appConfigProvider.getInitialPageRouteName();
    if (mounted) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/hti_logo.png",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
