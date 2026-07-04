import 'package:dio/dio.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_model.dart';

class ErrorHandler {
  static Future<BaseResponse<T>> handleApiCall<T>(
      Future<T> Function() call,
      ) async {
    try {
      final result = await call();
      return SuccessBaseResponse(result);
    } on DioException catch (e) {
      return ErrorBaseResponse(_handleDioError(e));
    } catch (e) {
      return ErrorBaseResponse(
        ErrorModel(status: 0, errorMessage: "حدث خطأ غير متوقع"),
      );
    }
  }

  static ErrorModel _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        if (e.response?.data != null) {
          return ErrorModel.fromJson(e.response!.data);
        }
        return ErrorModel(
          status: e.response?.statusCode ?? 500,
          errorMessage: "خطأ في السيرفر",
        );
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorModel(status: 0, errorMessage: "انتهى وقت الاتصال");
      case DioExceptionType.connectionError:
        return ErrorModel(status: 0, errorMessage: "لا يوجد اتصال بالإنترنت");
      default:
        return ErrorModel(status: 0, errorMessage: "حدث خطأ غير معروف");
    }
  }
}
