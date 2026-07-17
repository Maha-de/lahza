import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/repair/cubit/update_repair_status/update_repair_status_cubit.dart';
import 'package:lahza/features/repair/cubit/update_repair_status/update_repair_status_states.dart';
import 'package:lahza/features/repair/models/requests/update_repair_status_request.dart';
import 'package:lahza/features/repair/view/widgets/repair_option_card.dart';

class ConfirmTechnicianArrivalScreen extends StatelessWidget {
  final String repairId;

  const ConfirmTechnicianArrivalScreen({
    super.key,
    required this.repairId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "تأكيد وصول الفني",
      ),
      body: BlocConsumer<UpdateRepairStatusCubit,
          UpdateRepairStatusState>(
        listener: (context, state) {
          switch (state) {
            case UpdateRepairStatusSuccess():
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.repairResult,
                arguments: {
                  'repairId': repairId,
                },
              );
              break;

            case UpdateRepairStatusError():
              CustomSnackBar.showError(
                state.error.errorMessage,
              );
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          final cubit =
          context.read<UpdateRepairStatusCubit>();

          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.doneImage,
                      height: 260.h,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: 28.h),

                    Text(
                      "هل وصل الفني إلى موقعك؟",
                      style: AppTextStyles.primaryDark22500,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "يرجى تأكيد وصول الفني للمتابعة",
                      style: AppTextStyles.gray14400,
                      textAlign: TextAlign.center,
                    ),

                    SizedBox(height: 40.h),

                    RepairOptionCard(
                      title: "نعم وصل الفني",
                      color: Colors.green,
                      icon: Icons.check_circle,
                      onTap: () {
                        cubit.updateStatus(
                          repairId,
                          const UpdateRepairStatusRequest(
                            status: "HOME_REPAIR",
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 18.h),

                    RepairOptionCard(
                      title: "لم يصل بعد",
                      color: Colors.red,
                      icon: Icons.cancel,
                      onTap: () {
                        cubit.updateStatus(
                          repairId,
                          const UpdateRepairStatusRequest(
                            status: "CANCELED",
                          ),
                        );
                      },
                    ),

                    const Spacer(),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "تواصل مع الدعم",
                        style: AppTextStyles.primary14500,
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),

              if (state is UpdateRepairStatusLoading)
                Container(
                  color: Colors.black26,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}