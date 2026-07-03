import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/order_time_line/custom_status_card.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/order_time_line/order_time_line_info.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/order_time_line/order_time_line_item.dart';

class OrderTimeLineScreen extends StatelessWidget {
  const OrderTimeLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.orderStatusTitle,
        iconLeading: Icons.check,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
                        SizedBox(height: 24.h),

            const OrderStatusCard(),

            SizedBox(height: 24.h),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: timeline.length,
              itemBuilder: (context, index) {
                return OrderTimelineItem(
                  item: timeline[index],
                  isLast: index == timeline.length - 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}