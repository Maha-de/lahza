import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/order_screen/complete_order/order_info_card.dart';
import 'package:lahza/features/main_layout/home/order_screen/complete_order/order_info_item.dart';

class InspectionResultScreen extends StatelessWidget {
  const InspectionResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.inspectionResultTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            SizedBox(height: 12.h),

            Container(
              width: 90.w,
              height: 90.h,
              decoration: const BoxDecoration(
                color: AppColors.bannerBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, size: 50.r, color: Colors.green),
            ),

            SizedBox(height: 20.h),

            Text(
              AppStrings.inspectionSuccessTitle,
              style: AppTextStyles.primaryDark22500,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            Text(
              AppStrings.inspectionSuccessDesc,
              textAlign: TextAlign.center,
              style: AppTextStyles.gray14400,
            ),

            SizedBox(height: 24.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: OrderInfoItem.inspectionItems.length,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return OrderInfoCard(
                  titleStyle: AppTextStyles.gray14500,
                  valueStyle: AppTextStyles.primaryDark14500,
                  item: OrderInfoItem.inspectionItems[index],
                );
              },
            ),

            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.confirmOrder);
              },
              child: Text(AppStrings.followOrder),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
