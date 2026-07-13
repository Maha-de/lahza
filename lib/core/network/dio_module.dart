import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/network/api_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));

    dio.options.baseUrl = AppEndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 60);

    dio.options.headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  dio.interceptors.add(ApiInterceptor());

    return dio;
  }
}
