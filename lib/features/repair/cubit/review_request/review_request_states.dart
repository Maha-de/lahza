import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/repair_response.dart';

@immutable
sealed class ReviewRequestState {}

final class ReviewRequestInitial extends ReviewRequestState {}

final class ReviewRequestLoading extends ReviewRequestState {}

final class ReviewRequestSuccess extends ReviewRequestState {
  final RepairResponse repairResponse;

  ReviewRequestSuccess({
    required this.repairResponse,
  });
}

final class ReviewRequestError extends ReviewRequestState {
  final ErrorModel errorModel;

  ReviewRequestError({
    required this.errorModel,
  });
}