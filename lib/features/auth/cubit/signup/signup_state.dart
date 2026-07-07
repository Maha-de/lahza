import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final RegisterResponse data;

  RegisterSuccess({required this.data});
}

final class RegisterError extends RegisterState {
  final ErrorModel errorModel;

  RegisterError({required this.errorModel});
}
