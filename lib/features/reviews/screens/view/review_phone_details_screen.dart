import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/rating_bar_widget.dart';
import 'package:lahza/features/reviews/cubit/product_specs_cubit.dart';
import 'package:lahza/features/reviews/cubit/product_specs_state.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_cubit.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_state.dart';
import 'package:lahza/features/reviews/screens/widgets/rating_row_widget.dart';
import 'package:lahza/features/reviews/screens/widgets/specs_details_widget.dart';

class ReviewPhoneDetailsScreen extends StatefulWidget {
  const ReviewPhoneDetailsScreen({super.key});

  @override
  State<ReviewPhoneDetailsScreen> createState() =>
      _ReviewPhoneDetailsScreenState();
}

class _ReviewPhoneDetailsScreenState extends State<ReviewPhoneDetailsScreen> {
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

        context.read<ProductsSpecsCubit>().getProductSpecs(id);
      } else {
        print("Error: No ID passed to this screen!");
      }

      _isInit = false;
    }
  }

  final Map<String, String> labels = {
    "performance": "الأداء",
    "camera": "الكاميرا",
    "battery": "البطارية",
    "display": "الشاشة",
    "valueForMoney": "القيمة مقابل السعر",
  };

  @override
  Widget build(BuildContext context) {
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

                final Map<String, dynamic> ratings = {
                  "performance": display.data.performance,
                  "camera": display.data.camera,
                  "battery": display.data.battery,
                  "display": display.data.display,
                  "valueForMoney": display.data.valueForMoney,
                };
                return BlocBuilder<ProductsSpecsCubit, ProductsSpecsState>(
                  builder: (context, specState) {
                    switch (specState) {
                      case ProductsSpecsLoading _:
                        return const Center(child: CircularProgressIndicator());

                      case ProductsSpecsError _:
                        return Center(
                          child: Text(specState.errorModel.errorMessage),
                        );
                      case ProductsSpecsSuccess _:
                        final specItem = specState.detailsModel;
                        return Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            display.data.product.name,
                                            style: AppTextStyles
                                                .primaryDark18500,
                                          ),
                                          Text(
                                            display.data.product.brand,
                                            style: AppTextStyles.gray14500,
                                          ),

                                          Row(
                                            children: [
                                              RatingWidget(
                                                rating: display
                                                    .data
                                                    .overallRate,
                                              ),
                                              SizedBox(width: 5.h),
                                              Text(
                                                display.data.overallRate
                                                    .toString(),
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
                                              .images[0],

                                          errorWidget:
                                              (context, error, stackTrace) {
                                                print(
                                                  "عدد الصور في القائمة: ${display.data.product.images.length}",
                                                );
                                                if (display
                                                    .data
                                                    .product
                                                    .images
                                                    .isNotEmpty) {
                                                  print(
                                                    "الرابط الأول هو: ${display.data.product.images[0]}",
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
                                    ],
                                  ),

                                  SizedBox(height: 12.h),
                                  Container(
                                    height: 90.h,
                                    width: 320.w,
                                    padding: EdgeInsets.all(16.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        12.r,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.white90
                                              .withValues(alpha: 0.12),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),

                                    child: SpecsDetailsWidget(
                                      storage: specItem.data.specs.storage,
                                      battery: specItem.data.specs.battery,
                                      cpu: specItem.data.specs.cpu,
                                      screen: specItem.data.specs.screen,
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
                                    children: (display.data.pros ?? []).map(
                                      (item) {
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
                                                style: AppTextStyles
                                                    .primaryDark14500,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ),

                                  SizedBox(height: 15.h),
                                  Row(
                                    children: [
                                      Text(
                                        "العيوب",
                                        style: AppTextStyles.textRed,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),

                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: (display.data.cons ?? []).map(
                                      (item) {
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
                                                style: AppTextStyles
                                                    .primaryDark14500,
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15.h),

                            Container(
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
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "تقييم الاستخدام",
                                    style: AppTextStyles.primaryDark16500,
                                  ),

                                  SizedBox(height: 10.h),

                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Column(
                                      children: ratings.entries.map((
                                        entry,
                                      ) {
                                        return RatingRow(
                                          label:
                                              labels[entry.key] ??
                                              entry.key,
                                          value: entry.value.toDouble(),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 25.h),
                            Text(
                              "هل يستحق الشراء؟",
                              style: AppTextStyles.textGreen2,
                              textAlign: TextAlign.start,
                              // textDirection: TextDirection.rtl,
                            ),
                            SizedBox(height: 10.h),

                            Container(
                              height: 90.h,
                              width: 360.w,
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: AppColors.greenContainer,
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
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "نعم، يستحق الشراء",
                                        style: AppTextStyles.textGreen2,
                                        // textAlign: TextAlign.start,
                                        // textDirection: TextDirection.rtl,
                                      ),

                                      Text(
                                      AppStrings.worthBuyingSub,
                                        style: AppTextStyles.gray9500,
                                        // textAlign: TextAlign.start,
                                        // textDirection: TextDirection.rtl,
                                      ),
                                      //
                                      //
                                    ],
                                  ),

                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_off_alt_outlined,
                                      color: AppColors.success,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 15.h,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(150.w,40.h),
                                      backgroundColor: AppColors.white,
                                      foregroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("نعم", style: AppTextStyles.textRed,),

                                  ),
                                ),

                                SizedBox(width: 20.w,),

                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.white,
                                      foregroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          color: Colors.red,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Text("لا", style: AppTextStyles.textRed,),

                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h,),

                          ],
                        );
                      case ProductsSpecsInitial _:
                        return const SizedBox();
                    }
                  },
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
