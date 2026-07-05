import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';

@immutable
sealed class BuyPhoneState {}

final class BuyPhoneInitial extends BuyPhoneState {}

final class BuyPhoneLoading extends BuyPhoneState {}

final class BuyPhoneSuccess extends BuyPhoneState {
  final List<BuyPhoneModel> data;

  BuyPhoneSuccess({required this.data});
}

final class BuyPhoneError extends BuyPhoneState {
  final ErrorModel errorModel;

  BuyPhoneError({required this.errorModel});
}
