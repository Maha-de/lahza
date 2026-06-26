import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    this.onBack,
  });

  final String image;
  final String title;
  final String description;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Visibility(
            visible: onBack != null,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SvgPicture.asset(
            image,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),

        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.primaryDark24600,
        ),

        const SizedBox(height: 12),

        Text(
          description,
          textAlign: TextAlign.center,
          style:AppTextStyles.gray16500,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
