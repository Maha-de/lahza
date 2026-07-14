// import 'package:flutter/material.dart';
// import 'package:lahza/core/constants/app_strings.dart';
// import 'package:lahza/core/constants/app_text_styles.dart';

// class OrderInfoItem {
//   final IconData icon;
//   final String title;
//   final String? value;
//   final String? subtitle;
//   final TextStyle? titleStyle;
//   final TextStyle? valueStyle;
//   final TextStyle? subtitleStyle;

//   const OrderInfoItem({
//     required this.icon,
//     required this.title,
//     this.value,
//     this.subtitle,
//     this.titleStyle,
//     this.valueStyle,
//     this.subtitleStyle,
//   });

//   static final inspectionItems = [
//     OrderInfoItem(
//       icon: Icons.phone_android,
//       title: AppStrings.detectedIssue,
//       value: 'تلف في شاشة العرض',
//     ),
//     OrderInfoItem(
//       icon: Icons.payments_outlined,
//       title: AppStrings.estimatedCost,
//       value: '400 - 600 جنيه',
//     ),
//     OrderInfoItem(
//       icon: Icons.timer_outlined,
//       title: AppStrings.repairDuration,
//       value: '2 - 3 أيام',
//     ),
//     OrderInfoItem(
//       icon: Icons.location_on_outlined,
//       title: AppStrings.repairLocation,
//       value: 'في مركز الصيانة',
//     ),
//     OrderInfoItem(
//       icon: Icons.local_shipping_outlined,
//       titleStyle: AppTextStyles.primaryDark14500,
//       title: AppStrings.pickupMethod,
//       subtitle:
//           'سيتم إرسال مندوب لاستلام الجهاز \nمن عنوانك ونقلة الي مركز الصيانة',
//     ),
//   ];

//   static final confirmOrderItems = [
//     OrderInfoItem(
//       icon: Icons.phone_android,
//       title: AppStrings.phoneType,
//       value: 'iPhone 15',
//     ),
//     OrderInfoItem(
//       icon: Icons.phone_android,
//       title: AppStrings.detectedIssue,
//       value: 'تلف في شاشة العرض',
//     ),
//     OrderInfoItem(
//       icon: Icons.payments_outlined,
//       title: AppStrings.estimatedCost,
//       value: '400 - 600 جنيه',
//     ),
//     OrderInfoItem(
//       icon: Icons.local_shipping_outlined,
//       title: AppStrings.pickupMethod,
//       value: 'مندوب',
//       valueStyle: AppTextStyles.primaryDark14400,
//       subtitle: 'سيتم إرسال مندوب لاستلام جهازك',
//     ),
//     OrderInfoItem(
//       icon: Icons.timer_outlined,
//       title: AppStrings.pickupDate,
//       value: '15 يونيو - 5 مساءً',
//     ),
//     OrderInfoItem(
//       icon: Icons.location_on_outlined,
//       title: AppStrings.pickupAddress,
//       value: 'شارع صلاح سالم، أمام مستشفى الجامعة',
//     ),
//     OrderInfoItem(
//       icon: Icons.payments_outlined,
//       title: AppStrings.paymentMethod,
//       value: 'كاش عند الاستلام',
//     ),
//   ];
// }
