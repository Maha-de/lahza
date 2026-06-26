import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/features/main_layout/home/order_screen/complete_order/order_info_card.dart';
import 'package:lahza/features/main_layout/home/order_screen/complete_order/order_info_item.dart';

class ConfirmOrderScreen extends StatelessWidget {
  const ConfirmOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.confirmOrderTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppStrings.confirmOrderDesc, style: AppTextStyles.gray14500),

            SizedBox(height: 20.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: OrderInfoItem.confirmOrderItems.length,
              separatorBuilder: (_, _) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                return OrderInfoCard(
                  titleStyle: AppTextStyles.primaryDark14500,
                  valueStyle: AppTextStyles.gray14500,
                  item: OrderInfoItem.confirmOrderItems[index],
                );
              },
            ),

            SizedBox(height: 20.h),

            CustomCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.totalCost,
                        style: AppTextStyles.primaryDark16500,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppStrings.estimatedCost,
                        style: AppTextStyles.gray14500,
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('600 جنيه', style: AppTextStyles.primaryDark18600),
                      SizedBox(height: 8.h),
                      Text('600 جنيه', style: AppTextStyles.gray14500),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.assigningCourier);
              },
              child: Text(AppStrings.confirmOrder),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
