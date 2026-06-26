import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/main_layout/home/order_screen/tracking/courier_action_card.dart';

class CourierInfoCard extends StatelessWidget {
  const CourierInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          /// Row 1
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Image.asset(
                        AppAssets.courierImage,
                        width: 70.w,
                        height: 70.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.courierName,
                          style: AppTextStyles.primaryDark14500,
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          AppStrings.courierRole,
                          style: AppTextStyles.gray14400,
                        ),

                        SizedBox(height: 8.h),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 15.r),

                            SizedBox(width: 4.w),

                            Text('(4.8)', style: AppTextStyles.primary11400),

                            SizedBox(width: 4.w),

                            Text('(256 تقييم)', style: AppTextStyles.gray9500),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 12.w),

                    CourierActionCard(
                      icon: Icons.chat_bubble_outline,
                      title: AppStrings.chat,
                      onTap: () {},
                    ),

                    SizedBox(width: 8.w),

                    CourierActionCard(
                      icon: Icons.call_outlined,
                      title: AppStrings.call,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 25.h),

          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppStrings.vehicleType,
                      style: AppTextStyles.primaryDark14400,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      AppStrings.vehicleTypeValue,
                      style: AppTextStyles.gray14500,
                    ),
                  ],
                ),
              ),

              Container(width: 1, height: 70.h, color: Colors.grey.shade300),

              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppStrings.vehicleNumber,
                      style: AppTextStyles.primaryDark14400,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      AppStrings.vehicleNumberValue,
                      style: AppTextStyles.gray14500,
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
