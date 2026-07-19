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
import 'package:lahza/features/payment/cubit/subscription_status_cubit.dart';
import 'package:lahza/features/payment/cubit/subscription_status_state.dart';


class SubscriptionPendingScreen extends StatefulWidget {
  const SubscriptionPendingScreen({super.key});

  @override
  State<SubscriptionPendingScreen> createState() =>
      _SubscriptionPendingScreenState();
}

class _SubscriptionPendingScreenState
    extends State<SubscriptionPendingScreen> {
  late final SubscriptionStatusCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<SubscriptionStatusCubit>();
    cubit.startChecking();
  }

  @override
  void dispose() {
    cubit.stopChecking();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "جاري التحقق من الدفع",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        child: BlocConsumer<
            SubscriptionStatusCubit,
            SubscriptionStatusState>(
          listener: (context, state) {
            switch (state) {
              case SubscriptionStatusSuccess():
                if (cubit.isActive(state.subscriptionResponse)) {
                  cubit.stopChecking();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.mainLayout,
                        (route) => false,
                  );
                }

                if (cubit.isCancelled(state.subscriptionResponse)) {
                  cubit.stopChecking();

                  CustomSnackBar.showError(
                    "تم رفض طلب الاشتراك",
                  );

                  Navigator.pop(context);
                }

                break;

              case SubscriptionStatusError():
                CustomSnackBar.showError(
                  state.errorModel.errorMessage,
                );
                break;

              default:
                break;
            }
          },
          builder: (context, state) {
            switch (state) {
              case SubscriptionStatusLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case SubscriptionStatusError():
                return CustomErrorState(
                  message: state.errorModel.errorMessage,
                  onRetry: cubit.refresh,
                );

              default:
                return Column(
                  children: [
                    Text(
                      "تم استلام طلبك ويجري الآن التحقق من عملية الدفع",
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
                            "جاري التحقق من الدفع",
                            style: AppTextStyles.primaryDark18600,
                          ),

                          SizedBox(height: 12.h),

                          Text(
                            "سيتم تحديث حالة الاشتراك تلقائياً بمجرد مراجعة الدفع.",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.gray14400,
                          ),

                          const Spacer(),

                          const CircularProgressIndicator(),

                          SizedBox(height: 20.h),

                          Text(
                            "يتم التحقق تلقائياً كل دقيقة",
                            style: AppTextStyles.gray12400,
                          ),

                          const Spacer(),
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