import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/review_request/review_request_states.dart';
import 'package:lahza/features/repair/models/responses/repair_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';
import 'package:lahza/features/repair/view/enums/repair_status.dart';

@injectable
class ReviewRequestCubit extends Cubit<ReviewRequestState> {
  final RepairRepository repository;

  ReviewRequestCubit({
    required this.repository,
  }) : super(ReviewRequestInitial());

  Timer? _timer;

  bool _isFetching = false;

  bool get isChecking => _timer?.isActive ?? false;

  Future<void> fetchRepair(
    String repairId, {
    bool showLoading = true,
  }) async {
    if (_isFetching) return;

    _isFetching = true;

    if (showLoading) {
      emit(ReviewRequestLoading());
    }

    final response = await ErrorHandler.handleApiCall(
      () => repository.getRepairById(repairId),
    );

    switch (response) {
      case SuccessBaseResponse<RepairResponse>():
        emit(
          ReviewRequestSuccess(
            repairResponse: response.data,
          ),
        );

      case ErrorBaseResponse<RepairResponse>():
        emit(
          ReviewRequestError(
            errorModel: response.errorModel,
          ),
        );
    }

    _isFetching = false;
  }

  void startChecking(String repairId) {
    if (isChecking) return;

    fetchRepair(repairId);

    _timer = Timer.periodic(
      const Duration(seconds: 60),
      (_) {
        fetchRepair(
          repairId,
          showLoading: false,
        );
      },
    );
  }

  Future<void> refresh(String repairId) async {
    await fetchRepair(repairId);
  }

  void stopChecking() {
    _timer?.cancel();
    _timer = null;
  }

  RepairStatus? getStatus(RepairResponse response) {
    return RepairStatus.fromString(
      response.data!.status,
    );
  }

  bool canContinue(RepairResponse response) {
    final status = getStatus(response);

    return status == RepairStatus.inspectionDone ||
        status == RepairStatus.confirmed;
  }

  bool isCancelled(RepairResponse response) {
    return getStatus(response) == RepairStatus.canceled;
  }

  bool isCompleted(RepairResponse response) {
    return getStatus(response) == RepairStatus.completed;
  }

  @override
  Future<void> close() {
    stopChecking();
    return super.close();
  }
}