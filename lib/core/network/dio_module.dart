import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/network/api_interceptors.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = AppEndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  dio.interceptors.add(ApiInterceptor());

    return dio;
  }
}
