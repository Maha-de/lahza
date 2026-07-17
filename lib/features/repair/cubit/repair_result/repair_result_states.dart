import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/update_repair_status_response.dart';

sealed class RepairResultState {}

final class RepairResultInitial extends RepairResultState {}

final class RepairResultLoading extends RepairResultState {}

final class RepairResultSuccess extends RepairResultState {
  final UpdateRepairStatusResponse response;

  RepairResultSuccess({
    required this.response,
  });
}

final class RepairResultError extends RepairResultState {
  final ErrorModel error;

  RepairResultError({
    required this.error,
  });
}