import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';


@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class MyOrdersLoading extends MyOrdersState {}

final class MyOrdersSuccess extends MyOrdersState {
  final List<MyOrdersModel> myOrdersModel;
  MyOrdersSuccess({required this.myOrdersModel });
}

class MyOrdersError extends MyOrdersState {
  final ErrorModel errorModel;
  MyOrdersError({required this.errorModel});
}

