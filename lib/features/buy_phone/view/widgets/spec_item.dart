import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class SpecItem extends StatelessWidget {
  const SpecItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.primary, size: 24.sp),

        SizedBox(height: 8.h),

        Text(
          value,
          textAlign: TextAlign.center,
          style: AppTextStyles.primaryDark12400,
        ),

        SizedBox(height: 4.h),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.gray12400,
        ),
      ],
    );
  }
}
