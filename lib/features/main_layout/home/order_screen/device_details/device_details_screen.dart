import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/order_screen/custom_shadow_field.dart';
import 'package:lahza/features/main_layout/home/order_screen/device_details/add_image_card.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.deviceDataTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                AppStrings.deviceDataSubtitle,
                style: AppTextStyles.gray14400,
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              AppStrings.phoneTypeLabel,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 8.h),

            CustomShadowTextField(
              hintText: AppStrings.phoneTypeHint,
              height: 56.h,
              maxLines: 1,
            ),

            SizedBox(height: 20.h),

            Text(
              AppStrings.phoneModelLabel,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 8.h),

            CustomShadowTextField(
              hintText: AppStrings.phoneModelHint,
              height: 56.h,
              maxLines: 1,
            ),

            SizedBox(height: 20.h),

            Text(
              AppStrings.issueDescriptionLabel,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 8.h),

            CustomShadowTextField(
              hintText: AppStrings.issueDescriptionHintOrder,
              height: 150.h,
              maxLines: 6,
            ),

            SizedBox(height: 20.h),

            Text(
              AppStrings.issueImageLabel,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 8.h),
            AddImageCard(),
            SizedBox(height: 24.h),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.orderStatus);
              },
              child: Text(AppStrings.inspectIssueButton),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
