import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/features/repair/models/responses/order_info_item.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';

class InspectionResultMapper {
  static List<OrderInfoItem> map(RepairModel repair) {
    return [
      OrderInfoItem(
        icon: Icons.phone_android,
        title: AppStrings.detectedIssue,
        value: repair.diagnosisResult ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.payments_outlined,
        title: AppStrings.estimatedCost,
        value: "${repair.totalPrice ?? repair.estimatedCost ?? 0} جنيه",
      ),

      OrderInfoItem(
        icon: Icons.timer_outlined,
        title: AppStrings.repairDuration,
        value: repair.estimatedDuration ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.location_on_outlined,
        title: AppStrings.repairLocation,
        value: repair.repairLocation ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.local_shipping_outlined,
        title: AppStrings.pickupMethod,
        value: repair.deliveryMethod ?? "-",
      ),
    ];
  }
}
