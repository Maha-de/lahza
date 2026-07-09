import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/secure_storage_service.dart';
import 'package:lahza/features/auth/api_client/auth_api_client.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';

@lazySingleton
class AuthRepository {
  final AuthApiClient _apiClient;
  final SecureStorageService _secureStorageService;

  AuthRepository(
    this._apiClient,
    this._secureStorageService,
  );

Future<RegisterResponse> register(RegisterRequest request) async {
  final response = await _apiClient.register(request);

  await _secureStorageService.saveAccessToken(
    response.data.token,
  );

  return response;
}

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await _apiClient.login(request);

    await _secureStorageService.saveAccessToken(
      response.data.accessToken,
    );

    await _secureStorageService.saveRefreshToken(
      response.data.refreshToken,
    );

    return response;
  }

  Future<CompleteProfileResponse> completeProfile(
    CompleteProfileRequest request,
  ) async {
    return _apiClient.completeProfile(request);
  }

  // Future<LoginResponse> googleLogin(GoogleLoginRequest request) async {
  //   final response = await _apiClient.googleLogin(request);
  //
  //   await _secureStorageService.saveAccessToken(
  //     response.data.accessToken,
  //   );
  //
  //   await _secureStorageService.saveRefreshToken(
  //     response.data.refreshToken,
  //   );
  //
  //   return response;
  // }
}