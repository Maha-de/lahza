import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/main_layout/home/order_screen/tracking/order_time_line/order_time_line_info.dart';

class OrderTimelineItem extends StatelessWidget {
  final OrderTimelineInfo item;
  final bool isLast;

  const OrderTimelineItem({
    super.key,
    required this.item,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    Color color;

    if (item.isCompleted) {
      color = Colors.green;
    } else if (item.isCurrent) {
      color = AppColors.primary;
    } else {
      color = Colors.grey.shade300;
    }

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24.w,
            child: Column(
              children: [
                Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.isCompleted ? Colors.green : Colors.white,
                    border: Border.all(color: color, width: 3),
                  ),
                  child: item.isCompleted
                      ? const Icon(Icons.check, size: 12, color: Colors.white)
                      : null,
                ),

                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade300),
                  ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 28.h),
              child: Text(
                item.title,
                style: item.isCurrent
                    ? AppTextStyles.primary14500
                    : AppTextStyles.gray14500,
              ),
            ),
          ),

          Text(item.time, style: AppTextStyles.gray14400),
        ],
      ),
    );
  }
}
