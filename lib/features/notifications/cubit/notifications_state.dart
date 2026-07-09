import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';


@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final List<Data> notificationsModel;
  NotificationsSuccess({required this.notificationsModel });
}

class NotificationsError extends NotificationsState {
  final ErrorModel errorModel;
  NotificationsError({required this.errorModel});
}