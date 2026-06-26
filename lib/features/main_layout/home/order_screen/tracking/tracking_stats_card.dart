import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';

class TrackingStatsCard extends StatelessWidget {
  const TrackingStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: AppColors.primary),

          Expanded(
            child: Column(
              children: [
                Text(
                  AppStrings.remainingDistance,
                  style: AppTextStyles.gray14500,
                ),

                SizedBox(height: 4.h),

                Text(
                  AppStrings.remainingDistanceValue,
                  style: AppTextStyles.primary18600,
                ),
              ],
            ),
          ),
          Container(width: 1, height: 50.h, color: Colors.grey.shade300),

          Expanded(
            child: Column(
              children: [
                Text(AppStrings.remainingTime, style: AppTextStyles.gray14500),

                SizedBox(height: 4.h),

                Text(
                  AppStrings.remainingTimeValue,
                  style: AppTextStyles.primary18600,
                ),
              ],
            ),
          ),
          Icon(Icons.access_time, color: AppColors.primary),
        ],
      ),
    );
  }
}
