import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/services/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    // options.headers[AppEndPoints.token] =
    //     CacheHelper.getData(key: AppEndPoints.token) != null
    //     ? ' ${CacheHelper.getData(key: AppEndPoints.token)}'
    //     : null;
    options.headers["Authorization"] =
    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjM2Q0MmE2Zi0xNDljLTQyZDEtOGNiOC0zMTQyM2MwNzBmZDQiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc4MjE2ODU1NH0.DZvYX-XFd7vQCxDjdJz-oV4zxgz9EiHSTmfrAbDyaaw";
    print(options.headers);
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

