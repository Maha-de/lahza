import 'package:flutter/material.dart';

class LoginTopDecoration extends StatelessWidget {
  const LoginTopDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// فوق
          Positioned(
            left: -22,
            top: -52,
            child: _circle(),
          ),

          /// النص
          Positioned(
            left: -12,
            top: -7,
            child: _circle(),
          ),

          /// تحت
          Positioned(
            left: -61,
            top: 7,
            child: _circle(),
          ),
        ],
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xff81ADDE),
        shape: BoxShape.circle,
      ),
    );
  }
}