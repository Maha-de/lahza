import 'package:flutter/material.dart';

class IssueIcons {
  static IconData getIcon(String value) {
    switch (value.toUpperCase()) {
      case 'SCREEN':
        return Icons.phone_android;
      case 'BATTERY':
        return Icons.battery_5_bar;
      case 'CHARGING':
        return Icons.battery_charging_full;
      case 'NETWORK':
        return Icons.wifi;
      case 'SPEAKER':
        return Icons.volume_up;
      case 'MICROPHONE':
        return Icons.mic;
      case 'POWER_BUTTON':
        return Icons.power_settings_new;
      case 'CAMERA':
        return Icons.camera_alt;
      case 'SOFTWARE':
        return Icons.settings;
      case 'WATER_DAMAGE':
        return Icons.water_drop;
      case 'OVERHEATING':
        return Icons.device_thermostat;
      case 'STORAGE':
        return Icons.sd_storage;
      case 'OTHER':
        return Icons.more_horiz;
      default:
        return Icons.build;
    }
  }
}