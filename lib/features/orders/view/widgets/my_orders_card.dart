import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/device_info/models/response/repair_model.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';


class MyOrdersCard extends StatelessWidget {
  final Data item;
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
    //
    // DateTime? endDate;
    // String formattedDate = DateFormat('yyyy/MM/dd – HH:mm').format(endDate!);

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
          // SizedBox(width: 80.w, child: item.image),
          // Image.network(RepairModel.attachments.first),

          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${item.phoneType.name} ${item.phoneModel.name}", style: AppTextStyles.primary16500),
                SizedBox(height: 4.h),
                Text(
                  item.diagnosisResult ?? "",
                  style: AppTextStyles.gray14500,
                ),
                SizedBox(height: 4.h),
                // diagnosisResult
                Text(
                  intl.DateFormat('dd/MM/yyyy – HH:mm').format(item.createdAt),
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
                Text(item.requestNumber, style: AppTextStyles.primaryDark16500),
                SizedBox(height: 10.h),

                Text(item.status.name, style: AppTextStyles.primary11400),
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
                        style: AppTextStyles.primaryDark16500,
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
