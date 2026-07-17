import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/order_timeline/order_timeline_state.dart';
import 'package:lahza/features/repair/models/responses/track_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';

@injectable
class OrderTimelineCubit extends Cubit<OrderTimelineState> {
  final RepairRepository repository;

  OrderTimelineCubit(this.repository) : super(OrderTimelineInitial());

  Future<void> getTimeline(String repairId) async {
    emit(OrderTimelineLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.trackRepair(repairId),
    );

    switch (response) {
      case SuccessBaseResponse<TrackResponse>():
        emit(OrderTimelineSuccess(response.data.data!));

      case ErrorBaseResponse<TrackResponse>():
        emit(OrderTimelineError(response.errorModel));
    }
  }

  Future<void> refresh(String repairId) {
    return getTimeline(repairId);
  }
}
