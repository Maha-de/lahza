import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/rating_bar_widget.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_cubit.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_state.dart';

class PhoneDetailsScreen extends StatefulWidget {
  const PhoneDetailsScreen({super.key});

  @override
  State<PhoneDetailsScreen> createState() => _PhoneDetailsScreenState();
}

class _PhoneDetailsScreenState extends State<PhoneDetailsScreen> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print(
      "--- DEBUG RECEIVER: Raw Arguments: ${ModalRoute.of(context)?.settings.arguments} ---",
    );

    if (_isInit) {
      final args = ModalRoute.of(context)?.settings.arguments;

      if (args != null && args is String) {
        final String id = args;
        print("Received ID: $id"); // جربي طباعتها لتتأكدي!
        context.read<ReviewProductDetailsCubit>().getProductDetails(id);
      } else {
        print("Error: No ID passed to this screen!");
      }

      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final phone = ReviewPhoneDetailsModel.items;

    return Scaffold(
      appBar: AppBarWidget(title: "تفاصيل الهاتف"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<ReviewProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            switch (state) {
              case ProductDetailsLoading _:
                return const Center(child: CircularProgressIndicator());

              case ProductDetailsError _:
                return Center(child: Text(state.errorModel.errorMessage));

              case ProductDetailsSuccess _:
                final display = state.model;

                return Stack(
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
                                color: AppColors.white90.withValues(
                                  alpha: 0.12,
                                ),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        display.data.product.name,
                                        style: AppTextStyles.primaryDark18500,
                                      ),
                                      Text(
                                        display.data.product.brand,
                                        style: AppTextStyles.gray14500,
                                      ),

                                      Row(
                                        children: [
                                          RatingWidget(
                                            rating: display.data.overallRate,
                                          ),
                                          SizedBox(width: 5.h),
                                          Text(
                                            display.data.overallRate.toString(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: CachedNetworkImage(
                                      memCacheWidth: 100,
                                      memCacheHeight: 100,
                                      fit: BoxFit.cover,

                                      imageUrl: display
                                          .data
                                          .product
                                          .images[0], // الرابط

                                      errorWidget: (context, error, stackTrace) {

                                        print("عدد الصور في القائمة: ${display.data.product.images.length}");
                                        print("محتوى القائمة: $display.data.product.images");
                                        print("❌ نص الخطأ الحقيقي هو: ${error.toString()}");
                                        if (display.data.product.images.isNotEmpty) {
                                          print("الرابط الأول هو: ${display.data.product.images[0]}");
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
                                      color: AppColors.white90.withValues(
                                        alpha: 0.12,
                                      ),
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
                                          // Text(
                                          //   display.data.storage,
                                          //   style: AppTextStyles.gray9500,
                                          // ),
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
                                            Icons
                                                .battery_charging_full_outlined,
                                            color: AppColors.primaryDark,
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            "البطارية",
                                            style: AppTextStyles.primary11400,
                                          ),
                                          // Text(
                                          //   phone.battery,
                                          //   style: AppTextStyles.gray9500,
                                          // ),
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
                                          // Text(
                                          //   phone.processor,
                                          //   style: AppTextStyles.gray9500,
                                          // ),
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
                                          // Text(
                                          //   phone.screen,
                                          //   style: AppTextStyles.gray9500,
                                          // ),
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
                              Row(
                                children: [
                                  Text(
                                    "المييزات",
                                    style: AppTextStyles.textGreen,
                                    textAlign: TextAlign.start,
                                    // textDirection: TextDirection.rtl,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),

                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: (display.data.pros ?? []).map((item) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                              SizedBox(height: 15.h),
                              Row(
                                children: [
                                  Text("العيوب", style: AppTextStyles.textRed),
                                ],
                              ),
                              SizedBox(height: 10.h),

                              Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: (display.data.cons ?? []).map((item) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                );
              case ProductDetailsInitial _:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
