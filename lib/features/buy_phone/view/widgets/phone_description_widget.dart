import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';

class PhoneDescriptionWidget extends StatelessWidget {
  const PhoneDescriptionWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.description, style: AppTextStyles.primaryDark16500),

          SizedBox(height: 5.h),

          Text(
            description,
            style: AppTextStyles.gray14400,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
