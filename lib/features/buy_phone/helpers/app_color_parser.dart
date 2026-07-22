import 'package:flutter/material.dart';

class AppColorHelper {
  static Color getColor(String? color) {
    switch (color?.trim().toLowerCase()) {
      case 'black':
        return Colors.black;

      case 'white':
        return Colors.white;

      case 'red':
        return Colors.red;

      case 'blue':
        return Colors.blue;

      case 'green':
        return Colors.green;

      case 'yellow':
        return Colors.yellow;

      case 'orange':
        return Colors.orange;

      case 'purple':
        return Colors.purple;

      case 'pink':
        return Colors.pink;

      case 'brown':
        return Colors.brown;

      case 'grey':
      case 'gray':
        return Colors.grey;

      case 'silver':
        return const Color(0xFFC0C0C0);

      case 'gold':
        return const Color(0xFFFFD700);

      case 'navy':
        return const Color(0xFF001F54);

      case 'sky blue':
        return const Color(0xFF87CEEB);

      case 'light blue':
        return Colors.lightBlue;

      case 'cyan':
        return Colors.cyan;

      case 'teal':
        return Colors.teal;

      case 'mint':
        return const Color(0xFF98FF98);

      case 'lime':
        return Colors.lime;

      case 'olive':
        return const Color(0xFF808000);

      case 'indigo':
        return Colors.indigo;

      case 'violet':
        return const Color(0xFF8F00FF);

      case 'lavender':
        return const Color(0xFFE6E6FA);

      case 'maroon':
        return const Color(0xFF800000);

      case 'beige':
        return const Color(0xFFF5F5DC);

      case 'cream':
        return const Color(0xFFFFFDD0);

      case 'ivory':
        return const Color(0xFFFFFFF0);

      case 'charcoal':
        return const Color(0xFF36454F);

      case 'graphite':
        return const Color(0xFF383838);

      case 'space black':
        return const Color(0xFF1C1C1E);

      case 'midnight':
        return const Color(0xFF191970);

      case 'midnight green':
        return const Color(0xFF004953);

      case 'starlight':
        return const Color(0xFFF8F4E3);

      case 'sierra blue':
        return const Color(0xFF9DB7D5);

      case 'pacific blue':
        return const Color(0xFF1CA9C9);

      case 'deep purple':
        return const Color(0xFF673AB7);

      case 'rose':
      case 'rose gold':
        return const Color(0xFFB76E79);

      case 'coral':
        return const Color(0xFFFF7F50);

      case 'turquoise':
        return const Color(0xFF40E0D0);

      default:
        return Colors.grey.shade400;
    }
  }
}