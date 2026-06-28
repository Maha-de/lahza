import 'package:flutter/material.dart';


class MyOrdersItem {
  final Image image;
  final String title;
  final String? subtitle;
  final String? date;
  final String? status;
  final String? orderNumber;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const MyOrdersItem({
    required this.image,
    required this.title,
    this.date,
    this.status,
    this.subtitle,
    this.orderNumber,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });

  static final items = [
    MyOrdersItem(
      image: Image.asset("assets/images/iphone15.png"),
      title: "Iphone 15",
      subtitle: "إصلاح شاشة",
      date: "20 يونيو 2026 - 10:30 ص",
      orderNumber: "#12548",
      status: "قيد التنفيذ",
    ),
    MyOrdersItem(
      image: Image.asset("assets/images/oppo_reno.png"),
      title: "Oppo Reno 14",
      subtitle: "تغيير بطارية",
      date: "20 يونيو 2026 - 10:30 ص",
      orderNumber: "#12548",
      status: "مكتمل",
    ),
    MyOrdersItem(
      image: Image.asset("assets/images/oppo_a5.png"),
      title: "Oppo A5",
      subtitle: "إصلاح كاميرا",
      date: "20 يونيو 2026 - 10:30 ص",
      orderNumber: "#12548",
      status: "تم التسليم",
    ),
    MyOrdersItem(
      image: Image.asset("assets/images/samsung.png"),
      title: "Samsung Galaxy A14",
      subtitle: "تغيير شاشة",
      date: "20 يونيو 2026 - 10:30 ص",
      orderNumber: "#12548",
      status: "ملغي",
    ),
    MyOrdersItem(
      image: Image.asset("assets/images/oppo_reno.png"),
      title: "Oppo Reno 14",
      subtitle: "تغيير بطارية",
      date: "20 يونيو 2026 - 10:30 ص",
      orderNumber: "#12548",
      status: "مكتمل",
    ),
  ];
}
