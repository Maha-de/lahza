import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/main_layout/home/order_screen/complete_order/order_info_item.dart';

class OrderInfoCard extends StatelessWidget {
  final OrderInfoItem item;

  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const OrderInfoCard({
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
        children: [
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.bannerBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: AppColors.primary),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: titleStyle ?? AppTextStyles.gray14500),
                if (item.value != null) ...[
                  SizedBox(height: 4.h),

                  Text(
                    item.value!,
                    style: valueStyle ?? AppTextStyles.primaryDark14500,
                  ),
                ],

                if (item.subtitle != null) ...[
                  SizedBox(height: 4.h),

                  Text(
                    item.subtitle!,
                    style: subtitleStyle ?? AppTextStyles.gray14400,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
