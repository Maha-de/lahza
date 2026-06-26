import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class AddImageCard extends StatelessWidget {
  const AddImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColors.bannerBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 26.r,
              color: AppColors.primary,
            ),
          ),

          SizedBox(height: 12.h),

          Text(
            AppStrings.addImage,
            style: AppTextStyles.primaryDark15500,
          ),
          
        ],
      ),
    );
  }
}