import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';

class OrderStatusCard extends StatelessWidget {
  const OrderStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.delivery_dining, color: AppColors.primary, size: 28.r),
              SizedBox(width: 30.w),

              Column(
                children: [
                  Text('نوع الخدمة', style: AppTextStyles.gray14500),
                  SizedBox(height: 4.h),

                  Text(
                    'استلام جهاز بواسطة المندوب',
                    style: AppTextStyles.primary14500,
                  ),
                ],
              ),
              Spacer(),

              Text('#12548', style: AppTextStyles.primary14500),

              SizedBox(width: 8.w),

              const Icon(Icons.copy_outlined, color: Colors.grey),
            ],
          ),
                  SizedBox(height: 16.h),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: 16.h),

          Text('تاريخ الطلب', style: AppTextStyles.gray14400),

          SizedBox(height: 4.h),

          Text('20 يونيو 2026 - 10:30 ص', style: AppTextStyles.gray14400),
        ],
      ),
    );
  }
}
