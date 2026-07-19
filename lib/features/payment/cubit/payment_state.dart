import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';
sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object?> get props => [];
}

final class PaymentInitial extends PaymentState {
  const PaymentInitial();
}

final class PaymentLoading extends PaymentState {
  const PaymentLoading();
}

final class PaymentImagePicked extends PaymentState {
  final File image;

  const PaymentImagePicked(this.image);

  @override
  List<Object?> get props => [image];
}

final class PaymentSuccess extends PaymentState {
  final SubscriptionResponse response;

  const PaymentSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

final class PaymentFailure extends PaymentState {
  final String message;

  const PaymentFailure(this.message);

  @override
  List<Object?> get props => [message];
}