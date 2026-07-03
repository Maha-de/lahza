
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/reviews/screens/widgets/review_phones_details_model.dart';

class PhoneDetailsScreen extends StatelessWidget {
  const PhoneDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phone = PhoneDetailsModel.items.first;

    return Scaffold(
      appBar: AppBarWidget(title: "تفاصيل الهاتف"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: 650.h,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                phone.title,
                                style: AppTextStyles.primaryDark18500,
                              ),
                              Text(phone.brand, style: AppTextStyles.gray14500),
                            ],
                          ),
                          SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: phone.image,
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),
                      Container(
                        height: 90.h,
                        width: 320.w,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white90.withValues(alpha: 0.12),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.sd_storage_outlined,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "التخزين",
                                    style: AppTextStyles.primary11400,
                                  ),
                                  Text(
                                    phone.storage,
                                    style: AppTextStyles.gray9500,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: AppColors.grayLight,
                              thickness: 1,
                              width: 10, // المسافة المحجوزة للفاصل
                              indent: 2, // مسافة من الأعلى
                              endIndent: 2, // مسافة من الأسفل
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.battery_charging_full_outlined,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "البطارية",
                                    style: AppTextStyles.primary11400,
                                  ),
                                  Text(
                                    phone.battery,
                                    style: AppTextStyles.gray9500,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              color: AppColors.grayLight,
                              thickness: 1,
                              width: 10, // المسافة المحجوزة للفاصل
                              indent: 2, // مسافة من الأعلى
                              endIndent: 2, // مسافة من الأسفل
                            ),

                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.developer_board,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "المعالج",
                                    style: AppTextStyles.primary11400,
                                  ),
                                  Text(
                                    phone.processor,
                                    style: AppTextStyles.gray9500,
                                  ),
                                ],
                              ),
                            ),

                            VerticalDivider(
                              color: AppColors.grayLight,
                              thickness: 1,
                              width: 10, // المسافة المحجوزة للفاصل
                              indent: 2, // مسافة من الأعلى
                              endIndent: 2, // مسافة من الأسفل
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.smartphone,
                                    color: AppColors.primaryDark,
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "الشاشة",
                                    style: AppTextStyles.primary11400,
                                  ),
                                  Text(
                                    phone.screen,
                                    style: AppTextStyles.gray9500,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Divider(
                        color: AppColors.grayLight,
                        thickness: 1,
                        indent: 2, // مسافة من الأعلى
                        endIndent: 2, // مسافة من الأسفل
                      ),

                      SizedBox(height: 15.h),

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: (phone.pros ?? []).map((item) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),
                              SizedBox(width: 15.w),

                              Expanded(
                                child: Text(
                                  item,
                                  style: AppTextStyles.primaryDark14500,
                                ),
                              ),

                            ],
                          );
                        }).toList(),
                      ),

                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: (phone.cons ?? []).map((item) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(width: 15.w),

                              Expanded(
                                child: Text(
                                  item,
                                  style: AppTextStyles.primaryDark14500,
                                ),
                              ),

                            ],
                          );
                        }).toList(),
                      ),

                    ],
                  ),
                ),

                // Text("المميزات", style: AppTextStyles.primaryDark16500),
                //
                // SizedBox(height: 10.h),
                //
                // ...phone.pros.map(
                //   (e) => Padding(
                //     padding: EdgeInsets.only(bottom: 8.h),
                //     child: Row(
                //       children: [
                //         const Icon(Icons.check_circle, color: Colors.green),
                //
                //         SizedBox(width: 10.w),
                //
                //         Expanded(child: Text(e)),
                //       ],
                //     ),
                //   ),
                // ),
                //
                // SizedBox(height: 20.h),
                //
                // Text("العيوب", style: AppTextStyles.primaryDark16500),
                //
                // SizedBox(height: 10.h),
                //
                // ...phone.cons.map(
                //   (e) => Padding(
                //     padding: EdgeInsets.only(bottom: 8.h),
                //     child: Row(
                //       children: [
                //         const Icon(Icons.cancel, color: Colors.red),
                //
                //         SizedBox(width: 10.w),
                //
                //         Expanded(child: Text(e)),
                //       ],
                //     ),
                //   ),
                // ),
                //
                // SizedBox(height: 25.h),
                //
                // Text("تقييم الاستخدام", style: AppTextStyles.primaryDark16500),
                //
                // SizedBox(height: 15.h),
                //
                // _buildRate("البطارية", phone.batteryRate),
                //
                // _buildRate("الشاشة", phone.screenRate),
                //
                // _buildRate("الكاميرا", phone.cameraRate),
                //
                // _buildRate("الأداء", phone.performanceRate),
                //
                // _buildRate("القيمة مقابل السعر", phone.valueRate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
