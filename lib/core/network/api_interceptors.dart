import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/services/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppEndPoints.token] =
        CacheHelper.getData(key: AppEndPoints.token) != null
        ? ' ${CacheHelper.getData(key: AppEndPoints.token)}'
        : null;
    super.onRequest(options, handler);
  }
}


// Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//     ) async {
//   final accessToken = await _secureStorageService.getAccessToken();
//
//   if (accessToken != null && accessToken.isNotEmpty) {
//     options.headers[AppKeys.authorization] = 'Bearer $accessToken';
//   }
//
//   handler.next(options);

