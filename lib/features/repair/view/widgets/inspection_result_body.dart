import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/repair/models/responses/order_info_item.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';
import 'package:lahza/features/repair/view/widgets/order_info_card.dart';

class InspectionResultBody extends StatelessWidget {
  final RepairModel repair;
  final List<OrderInfoItem> items;
  final RepairFlow flow;

  const InspectionResultBody({
    super.key,
    required this.repair,
    required this.items,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
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
            child: Icon(
              Icons.check,
              size: 50.r,
              color: Colors.green,
            ),
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
            itemCount: items.length,
            separatorBuilder: (_, _) => SizedBox(height: 12.h),
            itemBuilder: (_, index) {
              return OrderInfoCard(
                item: items[index],
              );
            },
          ),

          SizedBox(height: 24.h),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.confirmOrder,
                  arguments: {
                    'repair': repair,
                    'flow': flow,
                  },
                );
              },
              child: const Text(
                AppStrings.followOrder,
              ),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}