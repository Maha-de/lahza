import 'package:equatable/equatable.dart';
import 'package:lahza/core/network/error_model.dart';

// class BaseState<T> extends Equatable {
//   final bool isLoading;
//   final T? data;
//   final String? errorMessage;
//
//   const BaseState({this.isLoading = false, this.data, this.errorMessage});
//
//   BaseState<T> copyWith({bool? isLoading, T? data, String? errorMessage}) {
//     return BaseState<T>(
//       isLoading: isLoading ?? this.isLoading,
//       data: data ?? this.data,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
//
//   @override
//   List<Object?> get props => [isLoading, data, errorMessage];
// }

abstract class BaseState {}

class SuccessState<T> extends BaseState {
  final T data;
  SuccessState(this.data);
}

class ErrorState extends BaseState {
  final ErrorModel errorModel; // بدلاً من String error
  ErrorState(this.errorModel);
}
