import 'package:flutter/material.dart';
import 'package:lahza/features/main_layout/home/home_screen.dart';
import 'package:lahza/features/notifications/screens/notification_screen.dart';
import 'package:lahza/features/profile/screens/profile_screen.dart';
import 'custom_bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final pages = const [HomeScreen(), ProfileScreen(), NotificationScreen(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
