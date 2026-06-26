import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';


class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: onTap,
      child: Container(
        height: 110.h,
        width: 160.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.white90.withValues(alpha: 0.12),
              blurRadius: 5,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(title, style: AppTextStyles.primaryDark15500),

                    SizedBox(height: 6.h),

                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.gray9400.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.bannerBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(child: Icon(icon, color: AppColors.primary)),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            Icon(Icons.arrow_forward, color: AppColors.primaryDark, size: 20.r),
          ],
        ),
      ),
    );
  }
}
class ServiceCardData {
  static final services = [
  
    (
      title: AppStrings.repairRequestTitle,
      description: AppStrings.repairRequestDesc,
      icon: Icons.handyman,
    ),
      (
      title: AppStrings.phoneEvaluationTitle,
      description: AppStrings.phoneEvaluationDesc,
      icon: Icons.description_outlined,
    ),

    (
      title: AppStrings.trackOrdersTitle,
      description: AppStrings.trackOrdersDesc,
      icon: Icons.receipt_long_outlined,
    ),
        (
      title: AppStrings.buyPhoneTitle,
      description: AppStrings.buyPhoneDesc,
      icon: Icons.smartphone_outlined,
    ),
  ];
}