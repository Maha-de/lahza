import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class OfferInfoItem {
  final Image image;
  final String title;
  final String? subtitle;
  final IconData? icon;
  final String? value;
  final String? discount;
  final ElevatedButton? button;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const OfferInfoItem({
    required this.image,
    required this.title,
    this.value,
    this.icon,
    this.subtitle,
    this.discount,
    this.button,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });


  static final items = [
    OfferInfoItem(
      image: Image.asset("assets/images/mobile.png"),
      // image: SvgPicture.asset(image1),
      title: "تغيير الشاشة",
      subtitle: "علي جميع  انواع الشاشات",
      icon: Icons.access_time_outlined,
      value: "ينتهي العرض خلال 7 ايام",
      discount: "خصم 15%",
      // button: ElevatedButton,
    ),
    OfferInfoItem(
      image: Image.asset("assets/images/battery.png"),
      title: "تغيير البطارية",
      subtitle: "بطاريات اصليه بضمان",
      icon: Icons.access_time_outlined,
      value: "ينتهي العرض خلال 3 ايام",
      discount: "خصم 20%",
      // button: ElevatedButton,
    ),
    OfferInfoItem(
      image: Image.asset("assets/images/camera.png"),
      title: "إصلاح الكاميرا",
      subtitle: "علي جميع انواع الكاميرات",
      icon: Icons.access_time_outlined,
      value: "ينتهي العرض خلال 5 ايام",
      discount: "خصم 10%",
      // button: ElevatedButton,
    ),OfferInfoItem(
      image: Image.asset("assets/images/repair.png"),
      title: "الصيانة الدورية",
      subtitle: "فحص شامل للجهاز",
      icon: Icons.access_time_outlined,
      value: "ينتهي العرض خلال 10 ايام",
      discount: "خصم 25%",
      // button: ElevatedButton,
    ),
  ];

}
