import 'package:dio/dio.dart';
import 'package:lahza/cache/cache_helper.dart';
import 'package:lahza/end_point.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper.getData(key: ApiKey.token) != null
        ? ' ${CacheHelper.getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
