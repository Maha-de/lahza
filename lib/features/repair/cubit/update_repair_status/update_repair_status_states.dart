import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/update_repair_status_response.dart';

sealed class UpdateRepairStatusState {}

class UpdateRepairStatusInitial extends UpdateRepairStatusState {}

class UpdateRepairStatusLoading extends UpdateRepairStatusState {}

class UpdateRepairStatusSuccess extends UpdateRepairStatusState {
  final UpdateRepairStatusResponse response;

  UpdateRepairStatusSuccess({
    required this.response,
  });
}

class UpdateRepairStatusError extends UpdateRepairStatusState {
  final ErrorModel error;

  UpdateRepairStatusError({
    required this.error,
  });
}