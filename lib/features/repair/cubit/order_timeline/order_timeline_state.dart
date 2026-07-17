import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';

sealed class OrderTimelineState {}

class OrderTimelineInitial extends OrderTimelineState {}

class OrderTimelineLoading extends OrderTimelineState {}

class OrderTimelineSuccess extends OrderTimelineState {
  final TrackModel track;

  OrderTimelineSuccess(this.track);
}

class OrderTimelineError extends OrderTimelineState {
  final ErrorModel errorModel;

  OrderTimelineError(this.errorModel);
}