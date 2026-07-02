import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class AssigningCourierScreen extends StatelessWidget {
  const AssigningCourierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.assigningCourierTitle,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 12.h,
        ),

        child: Column(
          children: [
            Text(
              AppStrings.assigningCourierSubtitle,
              style: AppTextStyles.gray14400,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40.h),

            Expanded(
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppAssets.assigningCourier,
                    height: 320.h,
                  ),

                  SizedBox(height: 24.h),

                  Text(
                    AppStrings.assigningCourierBodyTitle,
                    style: AppTextStyles.primaryDark18600,
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    AppStrings.assigningCourierBodyDescription,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.gray14400,
                  ),

                  const Spacer(),

                  ElevatedButton(
                    child: Text(AppStrings.trackOrderStatus),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.orderTracking,
                      );
                    },
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