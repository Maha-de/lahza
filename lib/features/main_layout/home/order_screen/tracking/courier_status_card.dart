import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';

class CourierStatusCard extends StatelessWidget {
  const CourierStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.courierOnTheWayTitle,
                style: AppTextStyles.primaryDark18600,
              ),

              SizedBox(height: 4.h),

              Text(
                AppStrings.courierOnTheWaySubtitle,
                style: AppTextStyles.primary14500,
              ),
            ],
          ),
          SizedBox(width: 50.w),

          Icon(Icons.delivery_dining, color: AppColors.primary, size: 34.r),
        ],
      ),
    );
  }
}
