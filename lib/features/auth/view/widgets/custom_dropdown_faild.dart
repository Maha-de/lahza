import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class CustomDropdownField extends StatelessWidget {
  final String title;
  final String hint;

  final IconData? icon;
  final Widget? trailingWidget;

  final VoidCallback onTap;

  const CustomDropdownField({
    super.key,
    required this.title,
    required this.hint,
    required this.onTap,
    this.icon,
    this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.grayLight),
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            trailingWidget ?? Icon(icon, color: AppColors.primary, size: 28.sp),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.primary16500,
                  ),

                  Text(
                    hint,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.gray14400,
                  ),
                ],
              ),
            ),

            const Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
