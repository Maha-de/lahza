import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/core/widgets/custom_error_state.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/repair/cubit/confirm_order/confirm_order_cubit.dart';
import 'package:lahza/features/repair/cubit/confirm_order/confirm_order_state.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';
import 'package:lahza/features/repair/view/mappers/confirm_order_mapper.dart';
import 'package:lahza/features/repair/view/widgets/order_info_card.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final RepairModel repair;
  final RepairFlow flow;
  const ConfirmOrderScreen({super.key, required this.repair, required this.flow});

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  late final ConfirmOrderCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<ConfirmOrderCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final items = ConfirmOrderMapper.map(widget.repair);

    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.confirmOrderTitle),
      body: BlocConsumer<ConfirmOrderCubit, ConfirmOrderState>(
        listener: (context, state) {
          switch (state) {
            case ConfirmOrderSuccess():
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.assigningCourier,
                arguments: {
                  'repairId': widget.repair.id,
                  'flow': widget.flow,
                },
              );
              break;

            case ConfirmOrderError():
              CustomSnackBar.showError(state.error.errorMessage);
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          switch (state) {
            case ConfirmOrderLoading():
              return const Center(child: CircularProgressIndicator());

            case ConfirmOrderError():
              return CustomErrorState(
                message: state.error.errorMessage,
                onRetry: () => _cubit.confirmRepair(widget.repair.id!),
              );

            case ConfirmOrderInitial():
            case ConfirmOrderSuccess():
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  children: [
                    Text(
                      AppStrings.confirmOrderDesc,
                      style: AppTextStyles.gray14500,
                    ),

                    SizedBox(height: 20.h),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (_, _) => SizedBox(height: 12.h),
                      itemBuilder: (_, index) {
                        return OrderInfoCard(
                          titleStyle: AppTextStyles.primaryDark14500,
                          valueStyle: AppTextStyles.gray14500,
                          item: items[index],
                        );
                      },
                    ),

                    SizedBox(height: 20.h),

                    CustomCard(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.totalCost,
                                style: AppTextStyles.primaryDark16500,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                AppStrings.estimatedCost,
                                style: AppTextStyles.gray14500,
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.repair.totalPrice ?? widget.repair.estimatedCost ?? 0} ${AppStrings.egp}",
                                style: AppTextStyles.primaryDark18600,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "${widget.repair.estimatedCost ?? 0} ${AppStrings.egp}",
                                style: AppTextStyles.gray14500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    ElevatedButton(
                      onPressed: () {
                        _cubit.confirmRepair(widget.repair.id!);
                      },
                      child: Text(AppStrings.confirmOrder),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
