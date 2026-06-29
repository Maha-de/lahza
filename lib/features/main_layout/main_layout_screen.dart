import 'package:flutter/material.dart';
import 'package:lahza/features/main_layout/custom_bottom_nav_bar.dart';
import 'package:lahza/features/main_layout/home/home_screen.dart';
import 'package:lahza/features/notifications/screens/notification_screen.dart';
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

  void _onItemTapped(int index) {
    if (currentIndex == index) return;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}