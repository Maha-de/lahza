import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

class TrackingStatsCard extends StatelessWidget {
  final TrackModel track;
  final RepairFlow flow;

  const TrackingStatsCard({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    return CustomCard(
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.primary,
          ),

          Expanded(
            child: Column(
              children: [
                Text(
                  AppStrings.remainingDistance,
                  style: AppTextStyles.gray14500,
                ),

                SizedBox(height: 4.h),

                Text(
                  isTechnician ? "1.2 كم" : "3.5 كم",
                  style: AppTextStyles.primary18600,
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
                  AppStrings.remainingTime,
                  style: AppTextStyles.gray14500,
                ),

                SizedBox(height: 4.h),

                Text(
                  isTechnician ? "20 دقيقة" : "12 دقيقة",
                  style: AppTextStyles.primary18600,
                ),
              ],
            ),
          ),

          const Icon(
            Icons.access_time,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}