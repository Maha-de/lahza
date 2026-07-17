import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/assigning_courier/assigning_courier_state.dart';
import 'package:lahza/features/repair/models/responses/track_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';

@injectable
class AssigningCourierCubit extends Cubit<AssigningCourierState> {
  final RepairRepository repository;

  AssigningCourierCubit(this.repository)
      : super(AssigningCourierInitial());

  Timer? _timer;

  bool _isFetching = false;

  bool get isChecking => _timer?.isActive ?? false;

  Future<void> fetchTrack(
    String repairId, {
    bool showLoading = true,
  }) async {
    if (_isFetching) return;

    _isFetching = true;

    if (showLoading) {
      emit(AssigningCourierLoading());
    }

    final response = await ErrorHandler.handleApiCall(
      () => repository.trackRepair(repairId),
    );

    switch (response) {
      case SuccessBaseResponse<TrackResponse>():
        emit(AssigningCourierSuccess(response.data));

      case ErrorBaseResponse<TrackResponse>():
        emit(AssigningCourierError(response.errorModel));
    }

    _isFetching = false;
  }

  void startChecking(String repairId) {
    if (isChecking) return;

    fetchTrack(repairId);

    _timer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => fetchTrack(
        repairId,
        showLoading: false,
      ),
    );
  }

  Future<void> refresh(String repairId) {
    return fetchTrack(repairId);
  }

  void stopChecking() {
    _timer?.cancel();
    _timer = null;
  }

  bool canContinue(TrackResponse response) {
    return response.data?.representativeName != null;
  }

  @override
  Future<void> close() {
    stopChecking();
    return super.close();
  }
}