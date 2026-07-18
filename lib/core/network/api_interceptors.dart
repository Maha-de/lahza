import 'dart:async';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_keys.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/services/secure_storage_service.dart';
import 'package:lahza/di/di.dart';
import 'package:lahza/features/auth/models/requests/refresh_token/refresh_token_request.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@lazySingleton
class ApiInterceptor extends Interceptor {
  final SecureStorageService _secureStorageService;
  bool _isRefreshing = false;
  Completer<String?>? _refreshTokenCompleter;

  ApiInterceptor(this._secureStorageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip adding token for refresh endpoint
    if (options.path.contains(AppEndPoints.refreshToken)) {
      return handler.next(options);
    }

    final accessToken = await _secureStorageService.getAccessToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers[AppKeys.authorization] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final requestOptions = err.requestOptions;

      // If it's already a refresh token request, logout
      if (requestOptions.path.contains(AppEndPoints.refreshToken)) {
        await _handleLogout();
        return handler.next(err);
      }

      if (_isRefreshing) {
        // Wait for the current refresh to finish
        final newToken = await _refreshTokenCompleter?.future;
        if (newToken != null) {
          try {
            final response = await _retry(requestOptions, newToken);
            return handler.resolve(response);
          } catch (e) {
            return handler.reject(DioException(requestOptions: requestOptions, error: e));
          }
        } else {
          return handler.next(err);
        }
      }

      _isRefreshing = true;
      _refreshTokenCompleter = Completer<String?>();

      try {
        final refreshToken = await _secureStorageService.getRefreshToken();
        if (refreshToken == null || refreshToken.isEmpty) {
          _refreshTokenCompleter?.complete(null);
          await _handleLogout();
          return handler.next(err);
        }

        // Resolving AuthRepository lazily to avoid circular dependency
        final authRepository = getIt<AuthRepository>();
        final response = await authRepository.refreshToken(
          RefreshTokenRequest(refreshToken: refreshToken),
        );

        final newAccessToken = response.data.accessToken;
        _refreshTokenCompleter?.complete(newAccessToken);

        final retryResponse = await _retry(requestOptions, newAccessToken);
        return handler.resolve(retryResponse);
      } catch (e) {
        _refreshTokenCompleter?.complete(null);
        await _handleLogout();
        return handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions options, String token) async {
    final dio = getIt<Dio>();
    options.headers[AppKeys.authorization] = 'Bearer $token';
    return dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
      ),
    );
  }

  Future<void> _handleLogout() async {
    await _secureStorageService.removeTokens();
    AppRoutes.navigatorKey.currentState?.pushNamedAndRemoveUntil(
      AppRoutes.login,
      (route) => false,
    );
  }
}
