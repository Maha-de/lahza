import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.controller,
    required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,

      child: SmoothPageIndicator(
        controller: controller,
        count: count,
        effect: const WormEffect(
          dotHeight: 10,
          dotWidth: 10,
          spacing: 8,
          activeDotColor: AppColors.primaryDark,
          dotColor: AppColors.unActiveIndecator,
        ),
      ),
    );
  }
}
