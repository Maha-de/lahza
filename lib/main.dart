import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_theme.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/core/services/notification_service.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_cubit.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'di/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.initialize("f2153bf9-8cff-4cd3-bcca-c4bcb518781d");
  OneSignal.Notifications.requestPermission(true);

  // 3. الاستماع للإشعار عند الضغط عليه (لفتح صفحة معينة مثلاً)
  OneSignal.Notifications.addClickListener((event) {
    print("تم الضغط على الإشعار: ${event.notification.title}");
    print("البيانات المرسلة مع الإشعار: ${event.notification.additionalData}");
  });

  // 4. الاستماع للإشعار عند وصوله أثناء فتح التطبيق (Foreground)
  OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    print("وصل إشعار والتطبيق مفتوح: ${event.notification.title}");

    // لعرض الإشعار بشكل طبيعي للمستخدم
    event.notification.display();
  });

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  configureDependencies();
  await CacheHelper.init();

  await NotificationService.initialize();

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BuyPhoneCubit>(create: (_) => getIt<BuyPhoneCubit>()),
          BlocProvider<FavoriteCubit>(create: (_) => getIt<FavoriteCubit>()),
        ],
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
      ),
    );
  }
}
