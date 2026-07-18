import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/payment/cubit/subscription_status_state.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';
import 'package:lahza/features/payment/repositories/subscription_repository.dart';

@injectable
class SubscriptionStatusCubit extends Cubit<SubscriptionStatusState> {
  final SubscriptionRepository repository;

  SubscriptionStatusCubit({
    required this.repository,
  }) : super(SubscriptionStatusInitial());

  Timer? _timer;

  bool _isFetching = false;

  bool get isChecking => _timer?.isActive ?? false;

  Future<void> fetchSubscription({
    bool showLoading = true,
  }) async {
    if (_isFetching) return;

    _isFetching = true;

    if (showLoading) {
      emit(SubscriptionStatusLoading());
    }

    final response = await ErrorHandler.handleApiCall(
          () => repository.getMySubscription(),
    );

    switch (response) {
      case SuccessBaseResponse<SubscriptionResponse>():
        emit(
          SubscriptionStatusSuccess(
            subscriptionResponse: response.data,
          ),
        );

      case ErrorBaseResponse<SubscriptionResponse>():
        emit(
          SubscriptionStatusError(
            errorModel: response.errorModel,
          ),
        );
    }

    _isFetching = false;
  }

  void startChecking() {
    if (isChecking) return;

    fetchSubscription();

    _timer = Timer.periodic(
      const Duration(minutes: 1),
          (_) {
        fetchSubscription(
          showLoading: false,
        );
      },
    );
  }

  Future<void> refresh() async {
    await fetchSubscription();
  }

  void stopChecking() {
    _timer?.cancel();
    _timer = null;
  }

  bool isPending(SubscriptionResponse response) {
    return response.data.status == "PENDING";
  }

  bool isActive(SubscriptionResponse response) {
    return response.data.status == "ACTIVE";
  }

  bool isCancelled(SubscriptionResponse response) {
    return response.data.status == "CANCELLED";
  }

  @override
  Future<void> close() {
    stopChecking();
    return super.close();
  }
}