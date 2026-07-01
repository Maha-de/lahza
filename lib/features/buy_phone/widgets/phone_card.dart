import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({
    super.key,
    required this.phoneName,
    required this.price,
    required this.image,
    required this.isFavorite,
    this.onFavorite,
    this.onDetails,
    required this.phoneStatus,
    required this.phoneCapacity,
  });

  final String phoneName;
  final String price;
  final String phoneStatus;
  final String phoneCapacity;
  final String image;
  final bool isFavorite;
  final VoidCallback? onFavorite;
  final VoidCallback? onDetails;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: 95.w, height: 95.h, fit: BoxFit.contain),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(phoneName, style: AppTextStyles.primaryDark16500),

                SizedBox(height: 4.h),

                Row(
                  children: [
                    Text(phoneStatus, style: AppTextStyles.gray14400),
                    SizedBox(width: 8.w),
                    Text(phoneCapacity, style: AppTextStyles.gray14400),
                  ],
                ),

                SizedBox(height: 6.h),

                Text(price, style: AppTextStyles.primaryDark12500),

                SizedBox(height: 10.h),

                Transform.translate(
                  offset: Offset(-80.w, 0.h),
                  child: SizedBox(
                    width: 150.w,
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: onDetails,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.containerBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "عرض التفاصيل",
                            style: AppTextStyles.primaryDark12500,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: AppColors.primary,
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),
          GestureDetector(
            onTap: onFavorite,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: const BoxDecoration(
                color: Color(0xffF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
