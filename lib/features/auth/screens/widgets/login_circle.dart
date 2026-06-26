import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_colors.dart';

class LoginCircle extends StatelessWidget {
  const LoginCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration:  BoxDecoration(
        color: AppColors.lightBlue,
        shape: BoxShape.circle,
      ),
    );
  }
}