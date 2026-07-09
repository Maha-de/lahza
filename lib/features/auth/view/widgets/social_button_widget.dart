import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const SocialButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 80.h,
        padding: EdgeInsets.all(22.r),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayLight),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: SvgPicture.asset(icon, fit: BoxFit.contain),
      ),
    );
  }
}
