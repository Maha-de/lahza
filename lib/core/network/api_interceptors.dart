import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/services/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override

  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI5MTZjZjAxZi1iNjNlLTQ1OWUtYWZiNy02ZGMzZjM4MzcyM2MiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc4MzI2NDg1OH0.IWpOaFNzXz5RAuCPcAWqJDg7HmHw2QppOrYjIbNTJGw';
    options.headers[AppEndPoints.token] =
        CacheHelper.getData(key: AppEndPoints.token) != null
        ? ' ${CacheHelper.getData(key: AppEndPoints.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
