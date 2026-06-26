import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

import 'offer_info_item.dart';

class OfferInfoCard extends StatelessWidget {
  final OfferInfoItem item;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const OfferInfoCard({
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
          SizedBox(
            width: 80.w,
            child: item.image,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style:
                      AppTextStyles.primary16500,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.subtitle!,
                  style:
                      AppTextStyles.gray14500,
                ),
                SizedBox(height: 4.h),

                Row(
                  children: [
                    Icon(item.icon, size: 16),

                    SizedBox(width: 5.w),
                    Text(
                      item.value!,
                      style:
                          AppTextStyles.gray9500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 100.w,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item.discount!, style: AppTextStyles.primaryDark16500),
                Container(
                  height: 35.h,
                  width: 100.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(100.w,35.h),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 6.h,
                        ),
                      ),

                      onPressed: () {
                  },
                      child: Text("استخدم العرض", style: TextStyle(overflow: TextOverflow.visible, fontSize: 12),)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
