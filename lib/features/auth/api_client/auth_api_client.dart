import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/requests/refresh_token/refresh_token_request.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/forgot_password_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/verify_reset_otp_request.dart';
import 'package:lahza/features/auth/models/requests/forgot_password/reset_password_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/models/responses/refresh_token/refresh_token_response.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';
import 'package:lahza/features/auth/models/responses/forgot_password/auth_action_response.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @POST(AppEndPoints.register)
  Future<RegisterResponse> register(@Body() RegisterRequest request);

  @POST(AppEndPoints.login)
  Future<LoginResponse> login(@Body() LoginRequest request);

  @POST(AppEndPoints.refreshToken)
  Future<RefreshTokenResponse> refreshToken(@Body() RefreshTokenRequest request);
  
  @POST(AppEndPoints.forgotPassword)
  Future<AuthActionResponse> forgotPassword(@Body() ForgotPasswordRequest request);
  
  @POST(AppEndPoints.verifyResetOtp)
  Future<AuthActionResponse> verifyResetOtp(@Body() VerifyResetOtpRequest request);
  
  @POST(AppEndPoints.resetPassword)
  Future<AuthActionResponse> resetPassword(@Body() ResetPasswordRequest request);

  @POST(AppEndPoints.completeProfile)
  Future<CompleteProfileResponse> completeProfile(
    @Body() CompleteProfileRequest request,
  );

  @POST(AppEndPoints.socialLogin)
  Future<LoginResponse> socialLogin(@Body() Map<String, dynamic> body);
}
