import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_error_state.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/repair/cubit/assigning_courier/assigning_courier_cubit.dart';
import 'package:lahza/features/repair/cubit/assigning_courier/assigning_courier_state.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

class AssigningCourierScreen extends StatefulWidget {
  final String repairId;
  final RepairFlow flow;

  const AssigningCourierScreen({
    super.key,
    required this.repairId,
    required this.flow,
  });

  @override
  State<AssigningCourierScreen> createState() =>
      _AssigningCourierScreenState();
}

class _AssigningCourierScreenState
    extends State<AssigningCourierScreen> {
  late final AssigningCourierCubit _cubit;

  bool get isCenter => widget.flow == RepairFlow.center;

  @override
  void initState() {
    super.initState();

    _cubit = context.read<AssigningCourierCubit>();
    _cubit.startChecking(widget.repairId);
  }

  @override
  void dispose() {
    _cubit.stopChecking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: isCenter
            ? AppStrings.assigningCourierTitle
            : AppStrings.assigningTechnicianTitle,
      ),
      body: BlocConsumer<AssigningCourierCubit, AssigningCourierState>(
        listener: (context, state) {
          switch (state) {
            case AssigningCourierSuccess():
              if (!mounted) return;

              if (_cubit.canContinue(state.trackResponse)) {
                _cubit.stopChecking();

                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.orderTracking,
                  arguments: {
                    'track': state.trackResponse.data!,
                    'flow': widget.flow,
                  },
                );
              }
              break;

            case AssigningCourierError():
              CustomSnackBar.showError(state.errorModel.errorMessage);
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          switch (state) {
            case AssigningCourierLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case AssigningCourierError():
              return CustomErrorState(
                message: state.errorModel.errorMessage,
                onRetry: () => _cubit.refresh(widget.repairId),
              );

            case AssigningCourierInitial():
            case AssigningCourierSuccess():
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 12.h,
                ),
                child: Column(
                  children: [
                    Text(
                      isCenter
                          ? AppStrings.assigningCourierSubtitle
                          : AppStrings.assigningTechnicianSubtitle, // أضفها
                      style: AppTextStyles.gray14400,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 40.h),

                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            isCenter
                                ? AppAssets.assigningCourier
                                : AppAssets.assigningTechnician, // أضفه
                            height: 320.h,
                          ),

                          SizedBox(height: 24.h),

                          Text(
                            isCenter
                                ? AppStrings.assigningCourierBodyTitle
                                : AppStrings.assigningTechnicianBodyTitle, // أضفها
                            style: AppTextStyles.primaryDark18600,
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            isCenter
                                ? AppStrings
                                .assigningCourierBodyDescription
                                : AppStrings
                                .assigningTechnicianBodyDescription, // أضفها
                            textAlign: TextAlign.center,
                            style: AppTextStyles.gray14400,
                          ),

                          const Spacer(),

                          const CircularProgressIndicator(),

                          SizedBox(height: 20.h),

                          Text(
                            isCenter
                                ? AppStrings.assigningCourierInProgress
                                : AppStrings.assigningTechnicianInProgress, // أضفها
                            style: AppTextStyles.gray12400,
                          ),

                          const Spacer(),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.mainLayout,
                                      (route) => false,
                                );
                              },
                              child: const Text(
                                AppStrings.backToHome,
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}