import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class WelcomeDialog extends StatelessWidget {
  const WelcomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary,width: 2),
                  ),
                  child: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

  Image.asset(AppAssets.welcomeDialog,),

            SizedBox(height: 24.h),

            Text(AppStrings.welcom, style: AppTextStyles.primary22500),

            SizedBox(height: 24.h),

            SizedBox(
              width: 180.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(AppStrings.exploreServices),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
