import 'package:lahza/core/network/error_model.dart';

sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String message;
  ForgotPasswordSuccess(this.message);
}

final class VerifyOtpSuccess extends ForgotPasswordState {
  final String message;
  VerifyOtpSuccess(this.message);
}

final class ResetPasswordSuccess extends ForgotPasswordState {
  final String message;
  ResetPasswordSuccess(this.message);
}

final class ForgotPasswordError extends ForgotPasswordState {
  final ErrorModel errorModel;
  ForgotPasswordError(this.errorModel);
}
