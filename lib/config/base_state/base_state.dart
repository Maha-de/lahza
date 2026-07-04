import 'package:lahza/core/network/error_model.dart';


abstract class BaseState {}

class SuccessState<T> extends BaseState {
  final T data;
  SuccessState(this.data);
}

class ErrorState extends BaseState {
  final ErrorModel errorModel;
  ErrorState(this.errorModel);
}
