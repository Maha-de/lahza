import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/di/di.dart';
import 'package:lahza/features/main_layout/custom_bottom_nav_bar.dart';
import 'package:lahza/features/main_layout/home/home_screen.dart';
import 'package:lahza/features/notifications/cubit/notifications_cubit.dart';
import 'package:lahza/features/notifications/view/screens/notification_screen.dart';
import 'package:lahza/features/profile/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  /// الرئيسية في المنتصف
  int currentIndex = 1;

  final List<Widget> pages = const [
    ProfileScreen(),       // 0 = حسابي
    HomeScreen(),          // 1 = الرئيسية
    NotificationScreen(),  // 2 = الإشعارات
  ];

  //       Navigator.pushNamed(context, AppRoutes.notificationScreen);
  // AppRoutes.notificationScreen

  void _onItemTapped(int index) {
    if (currentIndex == index) return;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider(
        create: (_) => getIt<NotificationsCubit>(),
    ),
          // BlocProvider(
          //   create: (context) => getIt<ProfileCubit>(),
          // ),
        ],
        child: Scaffold(
      extendBody: true,
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
            )
    );
  }
}