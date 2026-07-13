import 'package:flutter/material.dart';

class ProfileItem {
  final IconData icon;
  final String label;
  final String? route;

  const ProfileItem({required this.icon, required this.label, this.route});

  static final items = [
    ProfileItem(
      icon: Icons.person_outlined,
      label: 'بياناتي الشخصية',
      route: "/editProfile",
    ),
    ProfileItem(
        icon: Icons.gif_box,
        label: 'طلباتي',
        route: "/myOrders"
    ),
    ProfileItem(
      icon: Icons.favorite_border_outlined,
      label: "المفضلة",
      route: "/favorites",
    ),
    ProfileItem(
      icon: Icons.percent,
      label: "العروض",
      route: "/offer",
    ),
    ProfileItem(
      icon: Icons.notifications,
      label: "الاشعارات",
      route: "/notificationScreen",
    ),
    ProfileItem(
      icon: Icons.question_mark,
      label: "الدعم الفني",
      route: "/customerService",
    ),
  ];
}
