import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';

@immutable
sealed class SubscriptionStatusState {}

final class SubscriptionStatusInitial extends SubscriptionStatusState {}

final class SubscriptionStatusLoading extends SubscriptionStatusState {}

final class SubscriptionStatusSuccess extends SubscriptionStatusState {
  final SubscriptionResponse subscriptionResponse;

  SubscriptionStatusSuccess({
    required this.subscriptionResponse,
  });
}

final class SubscriptionStatusError extends SubscriptionStatusState {
  final ErrorModel errorModel;

  SubscriptionStatusError({
    required this.errorModel,
  });
}