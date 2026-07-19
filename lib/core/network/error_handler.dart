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
      // debugPrint("Dio Error: ${e.message}");
      // debugPrint("Response data: ${e.response?.data}");

      print("========== DIO ERROR ==========");
      print("Type: ${e.type}");
      print("Message: ${e.message}");
      print("Error: ${e.error}");
      print("Status Code: ${e.response?.statusCode}");
      print("Response Data: ${e.response?.data}");
      print("Request Data: ${e.requestOptions.data}");
      print("Request Path: ${e.requestOptions.path}");
      print("Method: ${e.requestOptions.method}");
      print("Headers: ${e.requestOptions.headers}");
      print("===============================");
      return ErrorBaseResponse(_handleDioError(e));
    } catch (e) {
      return ErrorBaseResponse(
        ErrorModel(status: false, errorMessage: "حدث خطأ غير متوقع "),
      );
    }
  }

  static ErrorModel _handleDioError(DioException e) {
    print(e.response?.data);

    switch (e.type) {

      case DioExceptionType.badResponse:
        if (e.response?.data != null && e.response?.data is Map<String, dynamic>) {
          return ErrorModel.fromJson(e.response!.data);
        }
        return ErrorModel(
          status: false,
          errorMessage: "خطأ في السيرفر: ${e.response?.statusCode}",
        );

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ErrorModel(status: false, errorMessage: "انتهى وقت الاتصال");
      case DioExceptionType.connectionError:
        return ErrorModel(status: false, errorMessage: "لا يوجد اتصال بالإنترنت");
      default:
        return ErrorModel(status: false, errorMessage: "حدث خطأ غير معروف");
    }
  }
}