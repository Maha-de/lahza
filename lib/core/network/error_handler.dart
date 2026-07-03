import 'package:dio/dio.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/constants/app_strings.dart';

class ErrorHandler {
  static Future<BaseResponse<T>> handleApiCall<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return SuccessBaseResponse(result);
    } catch (e) {
      return ErrorBaseResponse(_handle(e));
    }
  }

  static String _handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return AppStrings.connectionTimeout ;
        case DioExceptionType.sendTimeout:
          return AppStrings.sendTimeout;
        case DioExceptionType.receiveTimeout:
          return AppStrings.receiveTimeout ;
        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);
        case DioExceptionType.cancel:
          return AppStrings.requestCancelled ;
        case DioExceptionType.connectionError:
          return AppStrings.noInternetConnection ;
        case DioExceptionType.unknown:
          return AppStrings.unexpectedError ;
        default:
          return AppStrings.defaultErrorTryAgain ;
      }
    } else {
      return AppStrings.unknownError ;
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) {
      return AppStrings.unexpectedErrorTryAgain ;
    }

    final dynamic data = response.data;
    String? serverMessage;

    if (data is Map<String, dynamic>) {
      serverMessage = data['message'] ?? data['error'];
    }

    if (serverMessage != null) {
      return _mapErrorMessage(serverMessage);
    }

    switch (response.statusCode) {
      case 400:
        return AppStrings.invalidRequest ;
      case 401:
        return AppStrings.authFailed ;
      case 403:
        return AppStrings.forbidden ;
      case 404:
        return AppStrings.notFound ;
      case 500:
        return AppStrings.serverError ;
      default:
        return AppStrings.defaultError ;
    }
  }

  static String _mapErrorMessage(String message) {
    final lowerMessage = message.toLowerCase();

    if (lowerMessage.contains('user already exists')) {
      return AppStrings.userAlreadyExists ;
    }
    if (lowerMessage.contains('gender') &&
        lowerMessage.contains('must be one of')) {
      return AppStrings.invalidGender ;
    }
    if (lowerMessage.contains('invalid phone number format')) {
      return AppStrings.invalidPhoneFormat ;
    }

    return message;
  }
}
// class ErrorHandler {
//   static Future<BaseResponse<T>> handleApiCall<T>(
//     Future<T> Function() call,
//   ) async {
//     try {
//       final result = await call();
//       return SuccessBaseResponse(result);
//     } on DioException catch (e) {
//       // الآن نمرر الـ ErrorModel الذي يرجعه الميثود أدناه
//       return ErrorBaseResponse(_handleDioError(e));
//     } catch (e) {
//       return ErrorBaseResponse(
//         ErrorModel(status: 0, errorMessage: "حدث خطأ غير متوقع"),
//       );
//     }
//   }
//
//   // هذا هو الميثود الذي كان مفقوداً
//   static ErrorModel _handleDioError(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.badResponse:
//         if (e.response?.data != null) {
//           return ErrorModel.fromJson(e.response!.data);
//         }
//         return ErrorModel(
//           status: e.response?.statusCode ?? 500,
//           errorMessage: "خطأ في السيرفر",
//         );
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return ErrorModel(status: 0, errorMessage: "انتهى وقت الاتصال");
//       case DioExceptionType.connectionError:
//         return ErrorModel(status: 0, errorMessage: "لا يوجد اتصال بالإنترنت");
//       default:
//         return ErrorModel(status: 0, errorMessage: "حدث خطأ غير معروف");
//     }
//   }
// }
