import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/notifications/widgets/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const NotificationCard({
    super.key,
    required this.item,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.white90.withValues(alpha: 0.12),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.bannerBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: AppColors.primary),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.title, style: AppTextStyles.primary16500),
                SizedBox(height: 4.h),
                Text(item.subtitle!, style: AppTextStyles.gray14400),
                SizedBox(height: 4.h),
                Text(
                  item.time!,
                  style: AppTextStyles.primary12400,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          IconButton(

            onPressed: () {

            },
            icon: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: AppColors.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}
