import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/repair/models/responses/timeline_model.dart';

class OrderTimelineItem extends StatelessWidget {
  final TimelineModel item;
  final bool isLast;

  const OrderTimelineItem({
    super.key,
    required this.item,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final bool completed = item.completed ?? false;
    final bool current = item.current ?? false;

    final Color color = completed
        ? Colors.green
        : current
        ? AppColors.primary
        : Colors.grey.shade300;

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
                    color: completed
                        ? Colors.green
                        : Colors.white,
                    border: Border.all(
                      color: color,
                      width: 3,
                    ),
                  ),
                  child: completed
                      ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  )
                      : current
                      ? Container(
                    margin: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  )
                      : null,
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 28.h),
              child: Text(
                item.label ?? '',
                style: current
                    ? AppTextStyles.primary14500
                    : completed
                    ? AppTextStyles.primaryDark14500
                    : AppTextStyles.gray14500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}