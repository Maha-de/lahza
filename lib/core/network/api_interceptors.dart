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
    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4NDYyZjAxNS1lYTdmLTRmMTAtYTU1OS03OTI1YmVkODBkN2MiLCJyb2xlIjoiVVNFUiIsImlhdCI6MTc4MzkzMTIwMH0.JD2RduRgiqAnXZQfTtDPS2Ppaqs-3IdLfM9lk-VwSgc";
    print(options.headers);
    super.onRequest(options, handler);
  }
}
