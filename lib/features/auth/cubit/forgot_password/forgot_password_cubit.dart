import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/auth/cubit/forgot_password/forgot_password_state.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/forgot_password_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/reset_password_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/verify_reset_otp_request.dart';
import 'package:lahza/features/auth/models/responses/forgot_password/auth_action_response.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository repository;

  ForgotPasswordCubit(this.repository) : super(ForgotPasswordInitial());

  Future<void> forgotPassword(String email) async {
    print('DEBUG: sending OTP to email => $email');
    emit(ForgotPasswordLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.forgotPassword(ForgotPasswordRequest(email: email)),
    );

    if (response is SuccessBaseResponse<AuthActionResponse>) {
      emit(ForgotPasswordSuccess(response.data.message));
    } else if (response is ErrorBaseResponse<AuthActionResponse>) {
      emit(ForgotPasswordError(response.errorModel));
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    print('DEBUG: verifying OTP => $otp for email => $email');
    emit(ForgotPasswordLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.verifyResetOtp(VerifyResetOtpRequest(email: email, otp: otp)),
    );

    if (response is SuccessBaseResponse<AuthActionResponse>) {
      emit(VerifyOtpSuccess(response.data.message));
    } else if (response is ErrorBaseResponse<AuthActionResponse>) {
      emit(ForgotPasswordError(response.errorModel));
    }
  }

  Future<void> resetPassword(String email, String otp, String newPassword) async {
    print('DEBUG: resetting password for email => $email, otp => $otp, newPassword => $newPassword');
    emit(ForgotPasswordLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.resetPassword(ResetPasswordRequest(
        email: email,
        otp: otp,
        newPassword: newPassword,
      )),
    );

    if (response is SuccessBaseResponse<AuthActionResponse>) {
      emit(ResetPasswordSuccess(response.data.message));
    } else if (response is ErrorBaseResponse<AuthActionResponse>) {
      emit(ForgotPasswordError(response.errorModel));
    }
  }
}
