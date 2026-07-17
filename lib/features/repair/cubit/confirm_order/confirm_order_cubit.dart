import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/confirm_order/confirm_order_state.dart';
import 'package:lahza/features/repair/models/responses/confirm_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';

@injectable
class ConfirmOrderCubit extends Cubit<ConfirmOrderState> {
  final RepairRepository repository;

  ConfirmOrderCubit(this.repository) : super(ConfirmOrderInitial());

  Future<void> confirmRepair(String repairId) async {
    emit(ConfirmOrderLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.confirmRepair(repairId),
    );

    switch (response) {
      case SuccessBaseResponse<ConfirmResponse>():
        emit(ConfirmOrderSuccess(response.data));

      case ErrorBaseResponse<ConfirmResponse>():
        emit(ConfirmOrderError(response.errorModel));
    }
  }
}
