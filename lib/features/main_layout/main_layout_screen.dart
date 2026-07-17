import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/di/di.dart';
import 'package:lahza/features/main_layout/custom_bottom_nav_bar.dart';
import 'package:lahza/features/main_layout/home/home_screen.dart';
import 'package:lahza/features/notifications/cubit/notifications_cubit.dart';
import 'package:lahza/features/notifications/view/screens/notification_screen.dart';
import 'package:lahza/features/profile/cubit/profile_cubit.dart';
import 'package:lahza/features/profile/view/screens/profile_screen.dart';

class MainLayout extends StatefulWidget {
  final bool showWelcomeDialog;

  const MainLayout({super.key, this.showWelcomeDialog = false});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  /// الرئيسية في المنتصف
  int currentIndex = 1;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const ProfileScreen(), // 0 = حسابي
      HomeScreen(showWelcomeDialog: widget.showWelcomeDialog), // 1 = الرئيسية
      const NotificationScreen(), // 2 = الإشعارات
    ];
  }

  void _onItemTapped(int index) {
    if (currentIndex == index) return;

    if (index == 0) {
      Navigator.pushNamed(context, AppRoutes.profileScreen);
      // context.read<ProfileCubit>().fetchMyProfile();
    }

    if (index == 2) {
      Navigator.pushNamed(context, AppRoutes.notificationScreen);
      // context.read<NotificationsCubit>().fetchNotifications();
    }

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<NotificationsCubit>()),
        BlocProvider.value(value: getIt<ProfileCubit>()),
      ],
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          top: false,
          child: IndexedStack(index: currentIndex, children: pages),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
