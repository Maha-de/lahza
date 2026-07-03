import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<Data> data
  ReviewsSuccess({required this.data});
}

final class ReviewsError extends ReviewsState {
  final ErrorModel errorModel;
  ReviewsError({required this.errorModel});
}
