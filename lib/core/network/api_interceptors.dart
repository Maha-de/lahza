import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_keys.dart';
import 'package:lahza/core/services/secure_storage_service.dart';

@lazySingleton
class ApiInterceptor extends Interceptor {
  final SecureStorageService _secureStorageService;

  ApiInterceptor(this._secureStorageService);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _secureStorageService.getAccessToken();

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers[AppKeys.authorization] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}