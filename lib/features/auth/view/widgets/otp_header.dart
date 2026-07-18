import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(AppAssets.otpIcon),

        SizedBox(height: 16.h),

        Text(
          AppStrings.otpTitle,
          style: AppTextStyles.primaryDark22600,
        ),

        SizedBox(height: 10.h),

        Text(
          AppStrings.otpDescription,
          textAlign: TextAlign.center,
          style: AppTextStyles.gray16500,
        ),
      ],
    );
  }
}