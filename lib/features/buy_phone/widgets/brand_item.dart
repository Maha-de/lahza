import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/widgets/custom_container.dart';
import 'package:lahza/features/buy_phone/helpers/brand_icon_helper.dart';

class BrandItem extends StatelessWidget {
  const BrandItem({
    super.key,
    required this.brandName,
    this.isSelected = false,
    this.onTap,
  });

  final String brandName;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 7.w),
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        width: 75.w,
        height: 75.h,
        color: isSelected ? AppColors.primary : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              BrandIconHelper.getIcon(brandName),
              width: 12.w,
              height: 12.h,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : AppColors.primary,
                BlendMode.srcIn,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              brandName,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.primaryDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
