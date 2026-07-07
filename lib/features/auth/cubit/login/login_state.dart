import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final LoginResponse data;

  LoginSuccess({required this.data});
}

final class LoginError extends LoginState {
  final ErrorModel errorModel;

  LoginError({required this.errorModel});
}
