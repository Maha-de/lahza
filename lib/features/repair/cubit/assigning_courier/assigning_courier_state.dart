import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/track_response.dart';

sealed class AssigningCourierState {}

class AssigningCourierInitial extends AssigningCourierState {}

class AssigningCourierLoading extends AssigningCourierState {}

class AssigningCourierSuccess extends AssigningCourierState {
  final TrackResponse trackResponse;

  AssigningCourierSuccess(this.trackResponse);
}

class AssigningCourierError extends AssigningCourierState {
  final ErrorModel errorModel;

  AssigningCourierError(this.errorModel);
}