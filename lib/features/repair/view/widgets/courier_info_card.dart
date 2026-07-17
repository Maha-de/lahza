import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

import 'courier_action_card.dart';

class CourierInfoCard extends StatelessWidget {
  final TrackModel track;
  final RepairFlow flow;

  const CourierInfoCard({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    final String name = isTechnician
        ? "مصطفى أيمن"
        : (track.representativeName ?? "-");

    final String phone = isTechnician
        ? "01012345678"
        : (track.representativePhone ?? "-");

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: AppTextStyles.primaryDark14500,
                    ),

                    SizedBox(height: 2.h),

                    Text(
                      isTechnician
                          ? "فني صيانة"
                          : "مندوب الاستلام",
                      style: AppTextStyles.gray14400,
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15.r,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          "4.9",
                          style: AppTextStyles.primary11400,
                        ),

                        SizedBox(width: 4.w),

                        Text(
                          "(312 تقييم)",
                          style: AppTextStyles.gray9500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              CourierActionCard(
                icon: Icons.chat_bubble_outline,
                title: AppStrings.chat,
                onTap: () {},
              ),

              SizedBox(width: 8.w),

              CourierActionCard(
                icon: Icons.call_outlined,
                title: AppStrings.call,
                onTap: () {
                  // launchUrl(Uri.parse("tel:$phone"));
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Divider(
            color: Colors.grey.shade300,
          ),

          SizedBox(height: 16.h),

          if (isTechnician)
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "سنوات الخبرة",
                        style: AppTextStyles.primaryDark14400,
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "5+ سنوات",
                        style: AppTextStyles.gray14500,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 55.h,
                  color: Colors.grey.shade300,
                ),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "ضمان الإصلاح",
                        style: AppTextStyles.primaryDark14400,
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        "90 يوم",
                        style: AppTextStyles.gray14500,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.vehicleType,
                        style: AppTextStyles.primaryDark14400,
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        track.vehicleType ?? "-",
                        style: AppTextStyles.gray14500,
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 1,
                  height: 55.h,
                  color: Colors.grey.shade300,
                ),

                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.vehicleNumber,
                        style: AppTextStyles.primaryDark14400,
                      ),

                      SizedBox(height: 4.h),

                      Text(
                        track.vehicleNumber ?? "-",
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