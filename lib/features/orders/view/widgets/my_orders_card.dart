import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';

class MyOrdersCard extends StatelessWidget {
  final MyOrdersModel item;
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
      padding: EdgeInsets.all(14.r),
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
          Expanded(
            flex: 1,

            // child: Image.network(item.attachments.first)),
            child: SizedBox(
              height: 80.h,
              width: 75.w,
              child: (item.attachments != null && item.attachments!.isNotEmpty)
                  // (item.attachments.isNotEmpty)
                  ? CachedNetworkImage(
                      memCacheWidth: 75,
                      memCacheHeight: 80,
                      fit: BoxFit.cover,
                      imageUrl: item.attachments!.first,
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: Icon(Icons.broken_image, color: Colors.red),
                      ),
                    )
                  : Container(
                      width: 75,
                      height: 80,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${item.phoneType} ${item.phoneModel}",
                  style: AppTextStyles.primary16400,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.diagnosisResult ?? "",
                  style: AppTextStyles.gray14500,
                ),
                SizedBox(height: 4.h),
                Text(
                  item.createdAt != null
                      ? intl.DateFormat(
                          'dd/MM/yyyy – HH:mm',
                        ).format(item.createdAt!)
                      : 'لا يوجد تاريخ',
                  style: AppTextStyles.gray9500,
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   intl.DateFormat('dd/MM/yyyy – HH:mm').format(item.createdAt),
                //   style: AppTextStyles.gray9500,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(item.requestNumber, style: AppTextStyles.primaryDark14400),
                // SizedBox(height: 10.h),
                //
                // Text(item.status, style: AppTextStyles.primary11400),
                // SizedBox(height: 4.h),
                Text(
                  item.requestNumber ??
                      "غير معروف", // إذا كان null سيظهر "غير معروف" بدلاً من التطبيق
                  style: AppTextStyles.primaryDark14400,
                ),
                SizedBox(height: 10.h),
                Text(
                  item.status ?? "غير محدد", // نفس الشيء للحالة
                  style: AppTextStyles.primary11400,
                ),

                ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.primaryDark,
                    padding: EdgeInsets.all(5),
                  ),

                  onPressed: () {},
                  label: Text(
                    "عرض التفاصيل",
                    style: AppTextStyles.primaryDark12400,
                  ),
                  icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
