import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_model.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {
  final List<BuyPhoneFavoriteModel> favorites;

  FavoriteSuccess({required this.favorites});
}

final class FavoriteError extends FavoriteState {
  final ErrorModel errorModel;

  FavoriteError({required this.errorModel});
}
