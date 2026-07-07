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
    final token = await _secureStorageService.getToken();

    if (token != null && token.isNotEmpty) {
      options.headers[AppKeys.authorization] = 'Bearer $token';
    }

    handler.next(options);
  }
}
