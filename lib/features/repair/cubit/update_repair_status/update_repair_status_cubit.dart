import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/update_repair_status/update_repair_status_states.dart';
import 'package:lahza/features/repair/models/requests/update_repair_status_request.dart';
import 'package:lahza/features/repair/models/responses/update_repair_status_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';

@injectable
class UpdateRepairStatusCubit extends Cubit<UpdateRepairStatusState> {
  final RepairRepository repository;

  UpdateRepairStatusCubit({
    required this.repository,
  }) : super(UpdateRepairStatusInitial());

  Future<void> updateStatus(
      String repairId,
      UpdateRepairStatusRequest request,
      ) async {
    emit(UpdateRepairStatusLoading());

    final response = await ErrorHandler.handleApiCall(
          () => repository.updateRepairStatus(
        repairId,
        request,
      ),
    );

    switch (response) {
      case SuccessBaseResponse<UpdateRepairStatusResponse>():
        emit(
          UpdateRepairStatusSuccess(
            response: response.data,
          ),
        );
        break;

      case ErrorBaseResponse<UpdateRepairStatusResponse>():
        emit(
          UpdateRepairStatusError(
            error: response.errorModel,
          ),
        );
        break;
    }
  }
}