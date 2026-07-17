import 'package:lahza/core/constants/app_strings.dart';

class RepairUiMapper {
  static String repairLocation(String? value) {
    switch (value) {
      case "HOME":
        return AppStrings.atHome;

      case "CENTER":
        return AppStrings.inRepairCenter;

      default:
        return "-";
    }
  }

  static String deliveryMethod(String? value) {
    switch (value) {
      case "REPRESENTATIVE":
        return AppStrings.representative;

      case "SELF_DELIVERY":
        return AppStrings.selfDelivery;

      default:
        return "-";
    }
  }

  static String deliveryDescription(String? value) {
    switch (value) {
      case "REPRESENTATIVE":
        return AppStrings.representativeDescription;

      case "SELF_DELIVERY":
        return AppStrings.selfDeliveryDescription;

      default:
        return "";
    }
  }

  static String paymentMethod(String? value) {
    switch (value) {
      case "CASH_ON_DELIVERY":
        return AppStrings.cashOnDelivery;

      case "ONLINE":
        return AppStrings.onlinePayment;

      default:
        return "-";
    }
  }

  static String price(num? value) {
    if (value == null) return "-";
    return "$value ${AppStrings.egp}";
  }

  static String date(String? value) {
    if (value == null || value.isEmpty) return "-";

    final date = DateTime.tryParse(value);
    if (date == null) return value;

    return "${date.day}/${date.month}/${date.year}";
  }
}
