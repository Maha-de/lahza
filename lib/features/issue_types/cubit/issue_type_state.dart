import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_model.dart';

@immutable
sealed class IssueTypeState {}

final class IssueTypeInitial extends IssueTypeState {}

final class IssueTypeLoading extends IssueTypeState {}

final class IssueTypeSuccess extends IssueTypeState {
  final List<IssueTypeModel> data;

  IssueTypeSuccess({required this.data});
}

final class IssueTypeError extends IssueTypeState {
  final ErrorModel errorModel;

  IssueTypeError({required this.errorModel});
}
