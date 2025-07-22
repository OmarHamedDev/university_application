import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hti_university_app_1/features/presentation/splash/view/splash_view.dart';

import 'core/caching/secure_storge/cache_keys.dart';
import 'core/routes/app_page_route_provider.dart';
import 'core/utils/functions/bloc_observer/bloc_observer.dart';
import 'dependency_inversion/di.dart';
import 'features/auth/Verify_Password_Screen.dart';
import 'features/auth/forget_password_one.dart';
import 'features/presentation/login/view/log_in.dart';
import 'features/auth/reset_password.dart';
import 'features/data/data_source/offline_data_source/model/app_user_local_model/app_user_local_model.dart';
import 'features/home/admin_hom_tabs/requests/Reject_Reason.dart';
import 'features/home/admin_hom_tabs/requests/confirm_requests_admin.dart';
import 'features/home/admin_home_screen.dart';
import 'features/home/std_home_screen.dart';
import 'features/home/std_home_tabs/menu_items/documents.dart';
import 'features/home/std_home_tabs/menu_items/my_requests.dart';
import 'features/home/std_home_tabs/menu_items/profile.dart';
import 'features/home/std_home_tabs/notification_tab.dart';
import 'features/on_boarding/on_boarding_screen.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(AppUserLocalModelAdapter());
  if (!Hive.isBoxOpen(CacheKeys.user)) {
    await Hive.openBox<AppUserLocalModel>(CacheKeys.user);
  }

  runApp(ChangeNotifierProvider<AppConfigProvider>(create: (context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
          LogInScreen.routeName: (context) => LogInScreen(),
          ForgetPasswordOne.routeName: (context) => ForgetPasswordOne(),
          VerifyPasswordScreen.routeName: (context) => VerifyPasswordScreen(),
          ResetPassword.routeName: (context) => ResetPassword(),
          NotificationTab.routeName: (context) => NotificationTab(),
          StdHomeScreen.routeName: (context) => StdHomeScreen(),
          Profile.routeName: (context) => Profile(),
          MyRequests.routeName: (context) => MyRequests(),
          Documents.routeName: (context) => Documents(),
          AdminHomeScreen.routeName: (context) => AdminHomeScreen(),
          ConfirmRequestsAdmin.routeName: (context) => ConfirmRequestsAdmin(),
          RejectReason.routeName: (context) => RejectReason(),
        },

    );
  }
}
