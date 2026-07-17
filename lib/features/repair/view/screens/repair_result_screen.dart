import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/repair/cubit/repair_result/repair_result_cubit.dart';
import 'package:lahza/features/repair/cubit/repair_result/repair_result_states.dart';
import 'package:lahza/features/repair/view/widgets/repair_option_card.dart';

class RepairResultScreen extends StatefulWidget {
  final String repairId;

  const RepairResultScreen({
    super.key,
    required this.repairId,
  });

  @override
  State<RepairResultScreen> createState() =>
      _RepairResultScreenState();
}

class _RepairResultScreenState
    extends State<RepairResultScreen> {
  final TextEditingController reasonController =
  TextEditingController();

  bool showReason = false;

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "نتيجة الإصلاح",
      ),
      body: BlocConsumer<
          RepairResultCubit,
          RepairResultState>(
        listener: (context, state) {
          switch (state) {
            case RepairResultSuccess():
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.mainLayout,
                arguments: widget.repairId,
              );
              break;

            case RepairResultError():
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
          context.read<RepairResultCubit>();

          return Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),

                    Text(
                      "هل تم إصلاح المشكلة؟",
                      style: AppTextStyles.primaryDark22500,
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "يرجى اختيار النتيجة",
                      style: AppTextStyles.gray14400,
                    ),

                    SizedBox(height: 36.h),

                    RepairOptionCard(
                      title: "تم إصلاح المشكلة",
                      color: Colors.green,
                      icon: Icons.check_circle,
                      onTap: () {
                        cubit.submitRepairResult(
                          repairId: widget.repairId,
                          repaired: true,
                        );
                      },
                    ),

                    SizedBox(height: 18.h),

                    RepairOptionCard(
                      title: "لم يتم إصلاح المشكلة",
                      color: Colors.red,
                      icon: Icons.cancel,
                      onTap: () {
                        setState(() {
                          showReason = true;
                        });
                      },
                    ),

                    if (showReason) ...[
                      SizedBox(height: 32.h),

                      Text(
                        "سبب عدم الإصلاح",
                        style: AppTextStyles.primaryDark18600,
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        "يرجى توضيح السبب",
                        style: AppTextStyles.gray14400,
                      ),

                      SizedBox(height: 16.h),

                      TextField(
                        controller: reasonController,
                        maxLines: 6,
                        maxLength: 500,
                        decoration: InputDecoration(
                          hintText:
                          "اكتب تفاصيل عدم الإصلاح...",
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(16.r),
                          ),
                        ),
                      ),

                      SizedBox(height: 18.h),

                      SizedBox(
                        width: 150.w,
                        child: OutlinedButton(
                          onPressed: () {
                            if (reasonController.text
                                .trim()
                                .isEmpty) {
                              CustomSnackBar.showError(
                                "اكتب سبب عدم الإصلاح",
                              );
                              return;
                            }

                            cubit.submitRepairResult(
                              repairId: widget.repairId,
                              repaired: false,
                              reason: reasonController.text.trim(),
                            );
                          },
                          child: const Text("إرسال"),
                        ),
                      ),
                    ],

                    SizedBox(height: 40.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Support
                        },
                        child: const Text(
                          "تواصل مع الدعم الفني",
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),

              if (state is RepairResultLoading)
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