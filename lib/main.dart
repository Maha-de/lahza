import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_theme.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_cubit.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
