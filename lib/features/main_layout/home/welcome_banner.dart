import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.bannerBackground,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [BoxShadow(color: AppColors.lightBlue, blurRadius: 2)],
      ),

      child: Row(
        children: [
          Image.asset(AppAssets.welcomeBanner),
          SizedBox(width: 8.h),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppStrings.welcome, style: AppTextStyles.primaryDark24500),
                Text(AppStrings.inLahza, style: AppTextStyles.primaryDark18600),
                SizedBox(height: 8.h),

                Text(
                  AppStrings.welcomeDescription,
                  style: AppTextStyles.gray12400.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),

                SizedBox(height: 18.h),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppStrings.discoverServices,
                        style: AppTextStyles.white14500,
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.arrow_downward,
                        size: 18.r,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
