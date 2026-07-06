import 'package:equatable/equatable.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';

sealed class BuyPhoneDetailsState extends Equatable {
  const BuyPhoneDetailsState();

  @override
  List<Object?> get props => [];
}

class BuyPhoneDetailsInitial extends BuyPhoneDetailsState {}

class BuyPhoneDetailsLoading extends BuyPhoneDetailsState {}

class BuyPhoneDetailsSuccess extends BuyPhoneDetailsState {
  final BuyPhoneModel product;

  const BuyPhoneDetailsSuccess({required this.product});

  @override
  List<Object?> get props => [product];
}

class BuyPhoneDetailsError extends BuyPhoneDetailsState {
  final ErrorModel errorModel;

  const BuyPhoneDetailsError({required this.errorModel});

  @override
  List<Object?> get props => [errorModel];
}
