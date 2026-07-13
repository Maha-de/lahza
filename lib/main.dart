import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_theme.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/firebase_options.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  configureDependencies();
  await CacheHelper.init();

  runApp(const LahzaApp());
}

class LahzaApp extends StatelessWidget {
  const LahzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        builder: (context, child) {
          child = BotToastInit()(context, child);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Lahza',
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.mainTheme,
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
    );
  }
}
