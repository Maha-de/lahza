
import 'package:dio/dio.dart';
import 'package:lahza/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.badResponse:

      if (e.response?.data != null) {
        throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
      } else {
        throw ServerException(
          errModel: ErrorModel(
            status: e.response?.statusCode ?? 500,
            errorMessage: "حدث خطأ غير متوقع من السيرفر",
          ),
        );
      }

    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errModel: ErrorModel(status: 0, errorMessage: "انتهى وقت الاتصال، حاول مجدداً"),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        errModel: ErrorModel(status: 0, errorMessage: "لا يوجد اتصال بالإنترنت"),
      );

    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.unknown:
    default:
      throw ServerException(
        errModel: ErrorModel(status: 0, errorMessage: "حدث خطأ غير معروف"),
      );
  }
}
