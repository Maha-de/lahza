import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';

class OrderSearchField extends StatelessWidget {
  const OrderSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(40.r),
        border: Border.all(color: AppColors.white, width: 1),
        boxShadow: [
            BoxShadow(
              color: AppColors.white90.withValues(alpha: 0.30),
              blurRadius: 5,
              offset: Offset.zero,
            ),
          ],
      ),
      child: TextField(
        
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          
          hintText: AppStrings.searchIssue,
          prefixIcon: const Icon(Icons.search,color: AppColors.gray,size: 27,),

          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,

          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
        ),
      ),
    );
  }
}
