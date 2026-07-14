import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),

            Center(child: SvgPicture.asset(AppAssets.done)),
            SizedBox(height: 200.h),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 200.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: Text(AppStrings.backToLogin),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
