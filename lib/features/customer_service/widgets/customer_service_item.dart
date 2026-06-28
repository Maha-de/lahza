import 'package:flutter/material.dart';

class CustomerServiceItem {
  final IconData icon;
  final String label;
  final String subtitle;
  final String subSubTitle;
  final String? route;

  const CustomerServiceItem({
    required this.icon,
    required this.label,
    this.route,
    required this.subtitle,
    required this.subSubTitle,
  });

  static final items = [
    CustomerServiceItem(
      icon: Icons.person_outlined,
      label: 'واتساب',
      subtitle: "تواصل معانا علي الواتساب",
      subSubTitle: "012 345 678 95",
      route: "/editProfile",
    ),
    CustomerServiceItem(
      icon: Icons.phone_outlined,
      label: 'اتصل بنا',
      subtitle: "تحدث مباشرة مع احد ممثلي الدعم",
      subSubTitle: "012 345 678 95",
      route: "/myOrders",
    ),
    CustomerServiceItem(
      icon: Icons.email_outlined,
      label: "البريد الاكتروني",
      subtitle: "راسلنا وسنرد عليك في اقرب وقت",
      subSubTitle: "Support@laza.com",
      route: "/favorites",
    ),
    CustomerServiceItem(
      icon: Icons.wechat_outlined,
      label: "دردشة مباشرة",
      subtitle: "تحدث معانا الان عبر الدردشة المباشرة",
      subSubTitle: "متاح الان",
      route: "/favorites",
    ),
  ];
}
