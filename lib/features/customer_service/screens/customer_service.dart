import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/customer_service/widgets/customer_service_item.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.customerService),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: 400.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.r),
                color: AppColors.bannerBackground,
                shape: BoxShape.rectangle,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/images/customer_service.svg"),
                  SizedBox(
                    height: 150.h,
                    width: 200.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "نحن هنا لمساعدتك",
                          style: AppTextStyles.primary18500,
                        ),
                        Text(
                          "فريق الدعم متاح لخدمتك \n والاجابة علي جميع استفساراتك",
                          style: AppTextStyles.gray14400,
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),

                        Container(
                          width: 150.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            color: Color(0xFFB2CFEE),
                            shape: BoxShape.rectangle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.circle, color: Colors.green, size: 15),
                              Text(
                                "متاحين من 9 ص - 11 م",
                                style: AppTextStyles.primary12400,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 14.h),
            Text(
              "تواصل معنا",
              style: AppTextStyles.primary18500,
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 14.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 12.h),
              itemCount: CustomerServiceItem.items.length,

              itemBuilder: (context, index) {
                final item = CustomerServiceItem.items[index];

                return Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.white90.withValues(alpha: 0.12),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(18.r),
                    child: ListTile(
                      tileColor: AppColors.white,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      leading: Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.bannerBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(item.icon, color: AppColors.primary),
                      ),
                      title: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: AppTextStyles.primaryDark14500,
                          ),
                          Text(item.subtitle, style: AppTextStyles.gray14400),
                          Text(
                            item.subSubTitle,
                            style: AppTextStyles.primaryDark14500,
                          ),
                        ],
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
          ],
        ),
      ),
    );
  }
}
