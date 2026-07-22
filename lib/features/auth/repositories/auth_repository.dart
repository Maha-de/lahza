import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/secure_storage_service.dart';
import 'package:lahza/features/auth/api_client/auth_api_client.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/forgot_password_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/reset_password_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/verify_reset_otp_request.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/requests/refresh_token/refresh_token_request.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/forgot_password/auth_action_response.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/models/responses/refresh_token/refresh_token_response.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';

@lazySingleton
class AuthRepository {
  final AuthApiClient _apiClient;
  final SecureStorageService _secureStorageService;

  AuthRepository(this._apiClient, this._secureStorageService);

  Future<RegisterResponse> register(RegisterRequest request) async {
    final response = await _apiClient.register(request);

    await _secureStorageService.saveAccessToken(response.data.token);

    return response;
  }

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _apiClient.login(request);

    await _secureStorageService.saveAccessToken(response.data.accessToken);

    await _secureStorageService.saveRefreshToken(response.data.refreshToken);

    if (response.data.user.subscription != null) {
      await _secureStorageService
          .saveSubscriptionStatus(response.data.user.subscription!);
    }

    return response;
  }

  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    final response = await _apiClient.refreshToken(request);

    await _secureStorageService.saveAccessToken(response.data.accessToken);

    await _secureStorageService.saveRefreshToken(response.data.refreshToken);

    return response;
  }

  Future<AuthActionResponse> forgotPassword(ForgotPasswordRequest request) async {
    return _apiClient.forgotPassword(request);
  }

  Future<AuthActionResponse> verifyResetOtp(VerifyResetOtpRequest request) async {
    return _apiClient.verifyResetOtp(request);
  }

  Future<AuthActionResponse> resetPassword(ResetPasswordRequest request) async {
    return _apiClient.resetPassword(request);
  }

  Future<CompleteProfileResponse> completeProfile(
    CompleteProfileRequest request,
  ) async {
    return _apiClient.completeProfile(request);
  }
}
