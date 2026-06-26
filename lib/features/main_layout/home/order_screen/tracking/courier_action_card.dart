
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class CourierActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CourierActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(8.r),
          height: 60.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.r),
              boxShadow: [
            BoxShadow(
              color: AppColors.white90.withValues(alpha: 0.12),
              blurRadius: 5,
              offset: Offset.zero,
            ),
          ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppColors.primary,
                size: 15.r,
              ),

              SizedBox(height: 8.h),

              Text(
                title,
                style: AppTextStyles.primary14400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}