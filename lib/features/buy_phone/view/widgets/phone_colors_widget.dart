import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';
import 'package:lahza/features/buy_phone/helpers/app_color_parser.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_variant_model.dart';

class PhoneColorsWidget extends StatelessWidget {
  const PhoneColorsWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.variants,
  });

  final List<BuyPhoneVariantModel> variants;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.chooseColor, style: AppTextStyles.primaryDark16500),

          SizedBox(height: 5.h),

          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: variants.length,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
              separatorBuilder: (_, _) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final variant = variants[index];

                return GestureDetector(
                  onTap: () => onTap(index),
                  child: CustomContainer(
                    borderRadius: 7.r,
                    width: 100.w,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : Colors.transparent,
                      width: 1.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 18.w,
                          height: 18.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColorHelper.getColor(variant.color),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Text(
                            variant.color ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.primaryDark12500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
