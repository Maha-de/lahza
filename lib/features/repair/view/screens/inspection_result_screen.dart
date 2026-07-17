import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_error_state.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/repair/cubit/inspection_result/inspection_result_cubit.dart';
import 'package:lahza/features/repair/cubit/inspection_result/inspection_resutl_state.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';
import 'package:lahza/features/repair/view/widgets/inspection_result_body.dart';

class InspectionResultScreen extends StatefulWidget {
  final String repairId;

  const InspectionResultScreen({
    super.key,
    required this.repairId,
  });

  @override
  State<InspectionResultScreen> createState() =>
      _InspectionResultScreenState();
}

class _InspectionResultScreenState extends State<InspectionResultScreen> {
  late final InspectionResultCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<InspectionResultCubit>();
    _cubit.getInspection(widget.repairId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.inspectionResultTitle,
      ),
      body: BlocConsumer<InspectionResultCubit, InspectionResultState>(
        listener: (context, state) {
          switch (state) {
            case InspectionResultError():
              CustomSnackBar.showError(state.error.errorMessage);
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          switch (state) {
            case InspectionResultLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case InspectionResultError():
              return CustomErrorState(
                message: state.error.errorMessage,
                onRetry: () => _cubit.getInspection(widget.repairId),
              );

            case InspectionResultSuccess():
              final flow = state.repair.repairLocation == 'CENTER'
                  ? RepairFlow.center
                  : RepairFlow.technician;

              return InspectionResultBody(
                repair: state.repair,
                items: state.items,
                flow: flow,
              );

            case InspectionResultInitial():
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}