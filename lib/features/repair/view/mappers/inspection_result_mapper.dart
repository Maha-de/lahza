import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/features/repair/models/responses/order_info_item.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';
import 'package:lahza/features/repair/view/mappers/repair_ui_mapper.dart';

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
        value: RepairUiMapper.price(
          repair.totalPrice ?? repair.estimatedCost,
        ),
      ),

      OrderInfoItem(
        icon: Icons.timer_outlined,
        title: AppStrings.repairDuration,
        value: repair.estimatedDuration ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.location_on_outlined,
        title: AppStrings.repairLocation,
        value: RepairUiMapper.repairLocation(
          repair.repairLocation,
        ),
      ),

      OrderInfoItem(
        icon: Icons.local_shipping_outlined,
        title: AppStrings.pickupMethod,
        value: RepairUiMapper.deliveryMethod(
          repair.deliveryMethod,
        ),
      ),
    ];
  }
}