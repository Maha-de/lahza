import 'package:lahza/core/network/error_model.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  final T data;
  SuccessBaseResponse(this.data);
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final ErrorModel errorModel;
  ErrorBaseResponse(this.errorModel);
}