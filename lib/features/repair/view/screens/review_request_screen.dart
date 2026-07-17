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
import 'package:lahza/features/repair/cubit/review_request/review_request_cubit.dart';
import 'package:lahza/features/repair/cubit/review_request/review_request_states.dart';

class ReviewRequestScreen extends StatefulWidget {
  final String repairId;

  const ReviewRequestScreen({super.key, required this.repairId});

  @override
  State<ReviewRequestScreen> createState() => _ReviewRequestScreenState();
}

class _ReviewRequestScreenState extends State<ReviewRequestScreen> {
  late final ReviewRequestCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<ReviewRequestCubit>();
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
      appBar: const AppBarWidget(title: AppStrings.checkingIssueTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: BlocConsumer<ReviewRequestCubit, ReviewRequestState>(
          listener: (context, state) {
            switch (state) {
              case ReviewRequestSuccess():
                final cubit = context.read<ReviewRequestCubit>();

                if (!mounted) return;

                if (cubit.canContinue(state.repairResponse)) {
                  cubit.stopChecking();

                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.inspectionResult,
                    arguments: widget.repairId,
                  );
                }

                break;

              case ReviewRequestError():
                CustomSnackBar.showError(state.errorModel.errorMessage);

                break;

              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state) {
              case ReviewRequestLoading():
                return const Center(child: CircularProgressIndicator());

              case ReviewRequestError():
                return CustomErrorState(
                  message: state.errorModel.errorMessage,
                  onRetry: () => _cubit.refresh(widget.repairId),
                );

              case ReviewRequestSuccess():
              case ReviewRequestInitial():
                return Column(
                  children: [
                    Text(
                      AppStrings.checkingIssueSubtitle,
                      style: AppTextStyles.gray14400,
                    ),

                    SizedBox(height: 40.h),

                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            AppAssets.reviewRequest,
                            height: 320.h,
                          ),

                          SizedBox(height: 24.h),

                          Text(
                            AppStrings.reviewingOrderTitle,
                            style: AppTextStyles.primaryDark18600,
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            AppStrings.reviewingOrderDescription,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.gray14400,
                          ),

                          const Spacer(),

                          const CircularProgressIndicator(),

                          SizedBox(height: 20.h),

                          Text(
                            AppStrings.updatingOrderStatusAutomatically,
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
                );
            }
          },
        ),
      ),
    );
  }
}
