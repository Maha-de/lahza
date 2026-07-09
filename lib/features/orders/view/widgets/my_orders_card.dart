import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
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
      child: Expanded(
        child: Row(
          textDirection: TextDirection.ltr,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(width: 80.w, child: item.image),
            Expanded(
              flex: 1,
          // child: Image.network(item.attachments.first)),
        
          child:
          SizedBox(
            height: 80.h,
            width: 75.w,
            child: CachedNetworkImage(
              memCacheWidth: 75,
              memCacheHeight: 80,
              fit: BoxFit.cover,
        
              imageUrl: item.attachments.first,
        
              errorWidget:
                  (context, error, stackTrace) {
                print(
                  "عدد الصور في القائمة: ${item.attachments.length}",
                );
                if (item.attachments
                    .isNotEmpty) {
                  print(
                    "الرابط الأول هو: ${item.attachments[0]}",
                  );
                }
                return Container(
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
            ),
        
            Expanded(
              flex: 1,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${item.phoneType.name} ${item.phoneModel.name}", style: AppTextStyles.primary16400),
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
              flex: 1,
              child: Column(
        
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(item.requestNumber, style: AppTextStyles.primaryDark14400),
                  SizedBox(height: 10.h),
        
                  Text(item.status.name, style: AppTextStyles.primary11400),
                  // SizedBox(height: 4.h),
        
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     minimumSize: Size(70.w, 20.h),
                  //     backgroundColor: AppColors.white,
                  //     elevation: 0,
                  //     padding: EdgeInsets.all(5),
                  //   ),
                  //
                  //   onPressed: () {},
                  //   child: Expanded(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text(
                  //           "عرض التفاصيل",
                  //           style: AppTextStyles.primaryDark14400,
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 1,
                  //         ),
                  //         SizedBox(width: 2.w),
                  //         Icon(
                  //           Icons.arrow_forward_ios_rounded,
                  //           size: 14,
                  //           color: AppColors.primaryDark,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  ElevatedButton.icon(
                    iconAlignment: IconAlignment.end,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primaryDark,
                      padding: EdgeInsets.all(5),
                    ),

                    onPressed: () {},
                    label: Text("عرض التفاصيل", style: AppTextStyles.primaryDark12400,),
                    icon: const Icon(Icons.arrow_forward_ios_rounded, size: 14,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
