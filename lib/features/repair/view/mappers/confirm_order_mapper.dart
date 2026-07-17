import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/features/repair/models/responses/order_info_item.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';
import 'package:lahza/features/repair/view/mappers/repair_ui_mapper.dart';

class ConfirmOrderMapper {
  static List<OrderInfoItem> map(RepairModel repair) {
    return [
      OrderInfoItem(
        icon: Icons.phone_android,
        title: AppStrings.phoneType,
        value: "${repair.phoneType ?? "-"} ${repair.phoneModel ?? ""}",
      ),

      OrderInfoItem(
        icon: Icons.build_outlined,
        title: AppStrings.detectedIssue,
        value: repair.diagnosisResult ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.payments_outlined,
        title: AppStrings.estimatedCost,
        value: RepairUiMapper.price(repair.estimatedCost),
      ),

      OrderInfoItem(
        icon: Icons.local_shipping_outlined,
        title: AppStrings.pickupMethod,
        value: RepairUiMapper.deliveryMethod(repair.deliveryMethod),
        subtitle: RepairUiMapper.deliveryDescription(repair.deliveryMethod),
      ),

      OrderInfoItem(
        icon: Icons.timer_outlined,
        title: AppStrings.pickupDate,
        value: RepairUiMapper.date(repair.pickupDate),
      ),

      OrderInfoItem(
        icon: Icons.location_on_outlined,
        title: AppStrings.pickupAddress,
        value: repair.address ?? "-",
      ),

      OrderInfoItem(
        icon: Icons.payments,
        title: AppStrings.paymentMethod,
        value: RepairUiMapper.paymentMethod(repair.paymentMethod),
      ),
    ];
  }
}
