import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

class CourierStatusCard extends StatelessWidget {
  final TrackModel track;
  final RepairFlow flow;

  const CourierStatusCard({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    final String name = isTechnician
        ? "مصطفى أيمن"
        : (track.representativeName ?? "المندوب");

    return CustomCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isTechnician
                      ? "الفني في الطريق إليك"
                      : AppStrings.courierOnTheWayTitle,
                  style: AppTextStyles.primaryDark18600,
                ),

                SizedBox(height: 6.h),

                Text(
                  isTechnician
                      ? "متوقع وصول $name خلال 20 دقيقة"
                      : "$name ${AppStrings.courierOnTheWaySubtitle}",
                  style: AppTextStyles.primary14500,
                ),
              ],
            ),
          ),

          Icon(
            isTechnician
                ? Icons.handyman
                : Icons.delivery_dining,
            color: AppColors.primary,
            size: 36.r,
          ),
        ],
      ),
    );
  }
}