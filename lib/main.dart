import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/cache/cache_helper.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_theme.dart';
import 'di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await init(); // دالة الـ GetIt الخاصة بكِ
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
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Lahza',
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
