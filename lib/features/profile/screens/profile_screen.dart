import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/profile/widgets/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.profile),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120.h,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white90.withValues(alpha: 0.12),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,

                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: BoxDecoration(
                        color: AppColors.bannerBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, color: AppColors.primary),
                    ),
                    onTap: () {},
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("أحمد محمد", style: AppTextStyles.primaryDark16500),
                      Text("01234567895", style: AppTextStyles.gray9500),
                      Container(
                        width: 140.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color: AppColors.bannerBackground,
                          shape: BoxShape.rectangle,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.editProfile,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.editProfile,
                                style: AppTextStyles.primary12400,
                              ),
                              Icon(
                                Icons.edit,
                                color: AppColors.primary,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 12.h),
              itemCount: ProfileItem.items.length,

              itemBuilder: (context, index) {
                final item = ProfileItem.items[index];

                return Container(
                  decoration: BoxDecoration(
                    // color: AppColors.white,
                    // borderRadius: BorderRadius.circular(18.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white90.withValues(alpha: 0.12),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Material(
                    // color: AppColors.white,
                    borderRadius: BorderRadius.circular(18.r),
                    child: ListTile(
                      tileColor: AppColors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      leading: Icon(item.icon, color: AppColors.primary),
                      title: Text(
                        item.label,
                        style: AppTextStyles.primaryDark14500,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, item.route!);
                      },
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              onPressed: () {},
              icon: const Icon(Icons.exit_to_app),
              label: const Text("تسجيل خروج"),
            ),
            SizedBox(height: 20.h),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.red, // لون البوردر
                    width: 1, // سمك البوردر
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
              label: const Text("حذف الحساب"),
            ),
          ],
        ),
      ),
    );
  }
}
