import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

class OrderStatusCard extends StatelessWidget {
  final TrackModel track;
  final RepairFlow flow;

  const OrderStatusCard({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                isTechnician
                    ? Icons.handyman_outlined
                    : Icons.delivery_dining,
                color: AppColors.primary,
                size: 28.r,
              ),

              SizedBox(width: 30.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نوع الخدمة',
                    style: AppTextStyles.gray14500,
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    _serviceType(),
                    style: AppTextStyles.primary14500,
                  ),
                ],
              ),

              const Spacer(),

              Text(
                track.requestNumber ?? '',
                style: AppTextStyles.primary14500,
              ),

              SizedBox(width: 8.w),

              const Icon(
                Icons.copy_outlined,
                color: Colors.grey,
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Divider(color: Colors.grey.shade300),

          SizedBox(height: 16.h),

          Text(
            'تاريخ الطلب',
            style: AppTextStyles.gray14400,
          ),

          SizedBox(height: 4.h),

          Text(
            track.createdAt ?? '',
            style: AppTextStyles.gray14400,
          ),
        ],
      ),
    );
  }

  String _serviceType() {
    if (flow == RepairFlow.technician) {
      return 'إصلاح في المنزل';
    }

    switch (track.repairLocation) {
      case 'HOME':
        return 'إصلاح في المنزل';

      case 'CENTER':
        return 'استلام جهاز بواسطة المندوب';

      default:
        return '-';
    }
  }
}