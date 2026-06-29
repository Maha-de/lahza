import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';

class PhoneHeaderCard extends StatelessWidget {
  const PhoneHeaderCard({
    super.key,
    required this.phoneName,
    required this.image,
    required this.price,
    required this.phoneStatus,
    required this.phoneCapacity,
    required this.rate,
  });

  final String phoneName;
  final String image;
  final String price;
  final String phoneStatus;
  final String phoneCapacity;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: AppColors.bannerBackground,
      padding: EdgeInsets.all(18.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 120.w, height: 120.h, fit: BoxFit.contain),

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Text(
                    phoneStatus,
                    style: AppTextStyles.primaryDark12400,
                  ),
                ),
                Text(phoneName, style: AppTextStyles.primaryDark16500),

                SizedBox(height: 10.h),
                Text(phoneCapacity, style: AppTextStyles.primary12400),

                SizedBox(height: 14.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4.w),
                    Text(
                      rate.toString(),
                      style: AppTextStyles.black12500,
                    ),
                  ],
                ),

                SizedBox(height: 14.h),

                Text(price, style: AppTextStyles.primaryDark18500),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
