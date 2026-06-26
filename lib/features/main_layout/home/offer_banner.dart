import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class ExclusiveOfferBanner extends StatelessWidget {
  const ExclusiveOfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.exclusiveOffersTitle,
                style: AppTextStyles.white22600,
              ),
              Text(
                AppStrings.exclusiveOffersDesc,
                style: AppTextStyles.white12400,
              ),

              SizedBox(height: 12.h),

              ElevatedButton(
                onPressed: () {
                  // Action
                  Navigator.pushNamed(
                    context,
                    AppRoutes.offer,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 6.h,
                  ),
                  minimumSize: Size(110.w,35.h),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppStrings.shopNow, style: AppTextStyles.primaryDark12400),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.primaryDark,
                      size: 14.r,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
    // Expanded(
    //         flex: 4,
    //         child: SvgPicture.asset(
    //           AppAssets.offerPhone,
    //           fit: BoxFit.contain,
    //         ),
    //       ),