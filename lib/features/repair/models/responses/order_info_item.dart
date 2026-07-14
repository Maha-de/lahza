import 'package:flutter/widgets.dart';

class OrderInfoItem {
  final IconData icon;
  final String title;
  final String? value;
  final String? subtitle;

  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const OrderInfoItem({
    required this.icon,
    required this.title,
    this.value,
    this.subtitle,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });
}