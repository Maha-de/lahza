import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/orders/widgets/my_orders_item.dart';

class MyOrdersCard extends StatelessWidget {
  final MyOrdersItem item;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const MyOrdersCard({
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
        textDirection: TextDirection.ltr,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 80.w, child: item.image),

          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.title, style: AppTextStyles.primary16500),
                SizedBox(height: 4.h),
                Text(item.subtitle!, style: AppTextStyles.gray9500),
                SizedBox(height: 4.h),
                Text(
                  item.date!,
                  style: AppTextStyles.gray9500,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(

              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(item.orderNumber!, style: AppTextStyles.primaryDark16500),
                // SizedBox(height: 4.h),

                Text(item.status!, style: AppTextStyles.primary11400),
                // SizedBox(height: 4.h),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80.w, 20.h),
                    backgroundColor: AppColors.white,
                    elevation: 0,
                    padding: EdgeInsets.all(5),
                  ),

                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "عرض التفاصيل",
                        style: AppTextStyles.primary12400,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: AppColors.primaryDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
