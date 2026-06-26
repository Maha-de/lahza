import 'package:flutter/material.dart';

class IssueData {
  final String title;
  final IconData icon;

  const IssueData({
    required this.title,
    required this.icon,
  });
}

class IssuesType {
  static const List<IssueData> issues = [
    IssueData(
      title: 'شحن',
      icon: Icons.battery_charging_full,
    ),
    IssueData(
      title: 'بطارية',
      icon: Icons.battery_5_bar,
    ),
    IssueData(
      title: 'شاشة',
      icon: Icons.phone_android,
    ),
    IssueData(
      title: 'ميكروفون',
      icon: Icons.mic,
    ),
    IssueData(
      title: 'سماعة',
      icon: Icons.volume_up,
    ),
    IssueData(
      title: 'شبكة',
      icon: Icons.wifi,
    ),
    IssueData(
      title: 'كاميرا',
      icon: Icons.camera_alt,
    ),
    IssueData(
      title: 'زر التشغيل',
      icon: Icons.power_settings_new,
    ),
    IssueData(
      title: 'ذاكرة',
      icon: Icons.sd_storage,
    ),
    IssueData(
      title: 'سخونة',
      icon: Icons.device_thermostat,
    ),
    IssueData(
      title: 'مياه',
      icon: Icons.water_drop,
    ),
    IssueData(
      title: 'النظام',
      icon: Icons.settings,
    ),
  ];
}