import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';

class TrackingNoteCard extends StatelessWidget {
  const TrackingNoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shield_outlined,
            color: AppColors.primary,
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Text(
              AppStrings.trackingNote,
              style: AppTextStyles.primary14400,
            ),
          ),
        ],
      ),
    );
  }
}