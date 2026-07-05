import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/reviews/models/review_phone_details_model.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ReviewPhoneDetailsModel model;
  ProductDetailsSuccess({required this.model});
}


 class ProductDetailsError extends ProductDetailsState {
  final ErrorModel errorModel;
  ProductDetailsError({required this.errorModel});
}
