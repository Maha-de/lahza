import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/offers/models/offers_model.dart';


@immutable
sealed class OffersState {}

final class OffersInitial extends OffersState {}

final class OffersLoading extends OffersState {}

final class OffersSuccess extends OffersState {
  // final OffersModel offersModel;
  final List<Data> offersModel;
  OffersSuccess({required this.offersModel});
}


class OffersError extends OffersState {
  final ErrorModel errorModel;
  OffersError({required this.errorModel});
}
