import 'package:flutter/material.dart';

class NotificationItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? time;
  final String? status;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const NotificationItem({
    required this.icon,
    required this.title,
    this.time,
    this.status,
    this.subtitle,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });

  static final items = [
    NotificationItem(
      icon: Icons.bike_scooter,
      title: "المندوب في الطريق",
      subtitle: "المندوب أحمد سالم في طريقة اليك",
      time: "منذ 5 دقائق",
      status: "جديدة",
    ),
    NotificationItem(
      icon: Icons.check_circle,
      title: "تم تحديث حالة طلبك",
      subtitle: "تمت مراجعة المشكلة وجاري تجهيز قطع الغيار",
      time: "منذ 30 دقيقة",
      status: "جديدة",
    ),
    NotificationItem(
      icon: Icons.percent,
      title: "عرض جديد لك",
      subtitle: "خصم 20% علي تغيير الشاشة لفترة محدودة",
      time: "منذ ساعة",
      status: "جديدة",
    ),
    NotificationItem(
      icon: Icons.phone_android,
      title: "تم استلام جهازك",
      subtitle: "تم استلام الجهاز وسيتم فحصة قريبا",
      time: "أمس",
      status: "سابقا",
    ),
    NotificationItem(
      icon: Icons.phone_android,
      title: "شكرا لاختيارك لحظة",
      subtitle: "نحن سعداء بخدمتك",
      time: "منذ يومين",
      status: "سابقا",
    ),
    NotificationItem(
      icon: Icons.phone_android,
      title: "عرض خاص لفترة محدودة",
      subtitle: "خصم 15% علي الصيانة الدورية",
      time: "منذ 3 ايام",
      status: "سابقا",
    ),
    NotificationItem(
      icon: Icons.phone_android,
      title: "تم إنشاء الطلب",
      subtitle: "الفني ف الطريق اليك",
      time: "منذ اسبوع",
      status: "سابقا",
    ),
  ];
}
