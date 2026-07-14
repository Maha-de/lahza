import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/order_info_item.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';

sealed class InspectionResultState {}

class InspectionResultInitial extends InspectionResultState {}

class InspectionResultLoading extends InspectionResultState {}

class InspectionResultSuccess extends InspectionResultState {
  final RepairModel repair;
  final List<OrderInfoItem> items;

  InspectionResultSuccess({required this.repair, required this.items});
}

class InspectionResultError extends InspectionResultState {
  final ErrorModel error;

  InspectionResultError(this.error);
}
