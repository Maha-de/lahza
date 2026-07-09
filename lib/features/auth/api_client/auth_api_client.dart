import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';
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
  @POST(AppEndPoints.completeProfile)
  Future<CompleteProfileResponse> completeProfile(
    @Body() CompleteProfileRequest request,
  );
  // @POST(AppEndPoints.socialGoogle)
  // Future<LoginResponse> googleLogin(GoogleLoginRequest request);
}
