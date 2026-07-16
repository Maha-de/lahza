import 'package:flutter/material.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';


@immutable
sealed class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsSuccess extends NotificationsState {
  final List<NotificationsModel> notificationsModel;
  NotificationsSuccess({required this.notificationsModel });
}

class NotificationsError extends NotificationsState {
  final ErrorModel errorModel;
  NotificationsError({required this.errorModel});
}

// حالات خاصة بالـ MarkAsRead
final class MarkAsReadLoading extends NotificationsState {}
final class MarkAsReadSuccess extends NotificationsState {}
final class MarkAsReadError extends NotificationsState {
  final ErrorModel errorModel;
  MarkAsReadError({required this.errorModel});
}

// حالات خاصة بالعمليات الجماعية
final class BatchActionLoading extends NotificationsState {}
final class BatchActionSuccess extends NotificationsState {}
final class BatchActionError extends NotificationsState {
  final ErrorModel errorModel;
  BatchActionError({required this.errorModel});
}