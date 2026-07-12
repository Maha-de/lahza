import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class CustomDropdownField extends StatelessWidget {
  final String title;
  final String? value;
  final String hint;
  final IconData? icon;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final bool enabled;
  const CustomDropdownField({
    super.key,
    required this.title,
    required this.hint,
    required this.onTap,
    this.value,
    this.icon,
    this.trailingWidget,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = enabled && onTap != null;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Opacity(
        opacity: isEnabled ? 1 : 0.6,
        child: Container(
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isEnabled ? AppColors.grayLight : Colors.grey.shade300,
            ),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              trailingWidget ??
                  Icon(
                    icon,
                    color: isEnabled ? AppColors.primary : Colors.grey,
                  ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title),

                    SizedBox(height: 4.h),

                    Text(
                      value ?? hint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: value == null
                          ? AppTextStyles.gray14400
                          : AppTextStyles.primary16500,
                    ),
                  ],
                ),
              ),

              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isEnabled ? AppColors.primary : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
