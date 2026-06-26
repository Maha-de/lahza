import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class CompleteProfileWidget extends StatelessWidget {
  
  const CompleteProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
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

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          SvgPicture.asset(
            AppAssets.completeIcon,
            height: 155.h,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Text(
              AppStrings.completeDescription,
              textAlign: TextAlign.center,
              style: AppTextStyles.primaryDark12500,
            ),
          ),
        ],
      ),
    );
  }
}
