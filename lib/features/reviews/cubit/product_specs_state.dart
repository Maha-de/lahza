import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/reviews/models/products_specs_model.dart';


@immutable
sealed class ProductsSpecsState {}

final class ProductsSpecsInitial extends ProductsSpecsState {}

final class ProductsSpecsLoading extends ProductsSpecsState {}

final class ProductsSpecsSuccess extends ProductsSpecsState {
    final ProductsSpecsModel detailsModel;

    ProductsSpecsSuccess({required this.detailsModel});
}


class ProductsSpecsError extends ProductsSpecsState {
  final ErrorModel errorModel;
  ProductsSpecsError({required this.errorModel});
}
