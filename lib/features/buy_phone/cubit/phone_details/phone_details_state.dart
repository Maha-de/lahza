import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';

@immutable
sealed class BuyPhoneDetailsState {}

final class BuyPhoneDetailsInitial extends BuyPhoneDetailsState {}

final class BuyPhoneDetailsLoading extends BuyPhoneDetailsState {}

final class BuyPhoneDetailsSuccess extends BuyPhoneDetailsState {
  final BuyPhoneModel data;

  BuyPhoneDetailsSuccess({required this.data});
}

final class BuyPhoneDetailsError extends BuyPhoneDetailsState {
  final ErrorModel errorModel;

  BuyPhoneDetailsError({required this.errorModel});
}
