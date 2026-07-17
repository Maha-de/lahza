import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/confirm_response.dart';

sealed class ConfirmOrderState {}

class ConfirmOrderInitial extends ConfirmOrderState {}

class ConfirmOrderLoading extends ConfirmOrderState {}

class ConfirmOrderSuccess extends ConfirmOrderState {
  final ConfirmResponse response;

  ConfirmOrderSuccess(this.response);
}

class ConfirmOrderError extends ConfirmOrderState {
  final ErrorModel error;

  ConfirmOrderError(this.error);
}