import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class PaymentMethodItem extends StatelessWidget {
  final String image;
  final String title;
  final String number;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodItem({
    super.key,
    required this.image,
    required this.title,
    required this.number,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.white,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.white90.withValues(alpha: 0.12),
              blurRadius: 5,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.ltr,

          children: [
            SizedBox(
              width: 40.w,
              child: Center(
                child: SvgPicture.asset(image, width: 30.w, height: 30.h),
              ),
            ),
            SizedBox(width: 8.w),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title, style: AppTextStyles.primaryDark15500),
                  Text(number, style: AppTextStyles.gray14400),
                ],
              ),
            ),

            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryDark
                        : AppColors.grayLight,
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryDark,
                    ),
                  ),
                )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
