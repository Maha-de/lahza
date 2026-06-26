import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class ReviewRequestScreen extends StatelessWidget {
  const ReviewRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.checkingIssueTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: Column(
          children: [
            Text(
              AppStrings.checkingIssueSubtitle,
              style: AppTextStyles.gray14400,
            ),

            SizedBox(height: 40.h),

            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(AppAssets.reviewRequest, height: 320.h),

                  SizedBox(height: 24.h),

                  Text(
                    AppStrings.reviewingOrderTitle,
                    style: AppTextStyles.primaryDark18600,
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    AppStrings.reviewingOrderDescription,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.gray14400,
                  ),
                  SizedBox(height: 100.h),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.inspectionResult);
                    },
                    child: Text(AppStrings.trackOrderStatus),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
