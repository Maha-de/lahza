import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_lahza.png'),
            Text(AppStrings.welcom, style: AppTextStyles.primaryDark24600),
            Text(AppStrings.welcomDiscription, style: AppTextStyles.gray16400),
            SizedBox(height: 24.h),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
              },
              child: Text(AppStrings.login, style: AppTextStyles.white18600),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                elevation: 0,
                side: const BorderSide(color: AppColors.primary, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.r),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.register);
              },
              child: Text(
                AppStrings.createNewAccount,
                style: AppTextStyles.primaryDark18600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
