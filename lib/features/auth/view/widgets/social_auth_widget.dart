import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/auth/view/widgets/social_button_widget.dart';

class SocialAuthWidget extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onTwitterTap;
  final VoidCallback onFacebookTap;

  const SocialAuthWidget({
    super.key,
    required this.onGoogleTap,
    required this.onTwitterTap,
    required this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: AppColors.grayLight)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                AppStrings.creatAccountUsing,
                style: AppTextStyles.primary14400,
              ),
            ),
            const Expanded(child: Divider(color: AppColors.grayLight)),
          ],
        ),

        SizedBox(height: 20.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(icon: AppAssets.twitterIcon, onTap: onTwitterTap),
            SizedBox(width: 16.w),
            SocialButton(icon: AppAssets.googleIcon, onTap: onGoogleTap),

            SizedBox(width: 16.w),

            SocialButton(icon: AppAssets.facebookIcon, onTap: onFacebookTap),
          ],
        ),
      ],
    );
  }
}
