import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/repair/cubit/inspection_result/inspection_resutl_state.dart';
import 'package:lahza/features/repair/models/responses/repair_response.dart';
import 'package:lahza/features/repair/repositories/repair_repository.dart';
import 'package:lahza/features/repair/view/mappers/inspection_result_mapper.dart';

@injectable
class InspectionResultCubit extends Cubit<InspectionResultState> {
  final RepairRepository repository;

  InspectionResultCubit(this.repository) : super(InspectionResultInitial());

  Future<void> getInspection(String repairId) async {
    emit(InspectionResultLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getRepairById(repairId),
    );

    switch (response) {
      case SuccessBaseResponse<RepairResponse>():
        final repair = response.data.data!;

        emit(
          InspectionResultSuccess(
            repair: repair,
            items: InspectionResultMapper.map(repair),
          ),
        );

      case ErrorBaseResponse<RepairResponse>():
        emit(InspectionResultError(response.errorModel));
    }
  }
}
