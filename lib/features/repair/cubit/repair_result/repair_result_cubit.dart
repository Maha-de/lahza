import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/repair_result/repair_result_states.dart';
import 'package:lahza/features/repair/models/requests/update_repair_status_request.dart';
import 'package:lahza/features/repair/models/responses/update_repair_status_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';

@injectable
class RepairResultCubit extends Cubit<RepairResultState> {
  final RepairRepository repository;

  RepairResultCubit({
    required this.repository,
  }) : super(RepairResultInitial());

  Future<void> submitRepairResult({
    required String repairId,
    required bool repaired,
    String? reason,
  }) async {
    emit(RepairResultLoading());

    final response = await ErrorHandler.handleApiCall(
          () => repository.updateRepairStatus(
        repairId,
        UpdateRepairStatusRequest(
          status: repaired ? "COMPLETED" : "CANCELED",
          reason: repaired ? null : reason,
        ),
      ),
    );

    switch (response) {
      case SuccessBaseResponse<UpdateRepairStatusResponse>():
        emit(
          RepairResultSuccess(
            response: response.data,
          ),
        );
        break;

      case ErrorBaseResponse<UpdateRepairStatusResponse>():
        emit(
          RepairResultError(
            error: response.errorModel,
          ),
        );
        break;
    }
  }
}