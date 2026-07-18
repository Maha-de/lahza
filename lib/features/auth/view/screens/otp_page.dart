import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/helpers/time_formatter.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/auth/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:lahza/features/auth/cubit/forgot_password/forgot_password_state.dart';
import 'package:lahza/features/auth/view/widgets/otp_header.dart';
import 'package:lahza/features/auth/view/widgets/otp_timer.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({super.key, required this.email});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  Timer? _timer;

  int _startSeconds = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    print('DEBUG: OtpPage initialized with email: ${widget.email}');
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    setState(() {
      _startSeconds = 60;
      _canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_startSeconds == 0) {
        timer.cancel();

        setState(() {
          _canResend = true;
        });
      } else {
        setState(() {
          _startSeconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  PinTheme get pinTheme => PinTheme(
    width: 50.w,
    height: 50.h,
    textStyle: AppTextStyles.primaryDark18600,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
      border: Border.all(color: AppColors.primary, width: 2),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is VerifyOtpSuccess) {
          CustomSnackBar.showSuccess(state.message);
          Navigator.pushNamed(
            context,
            AppRoutes.createNewPassword,
            arguments: {
              'email': widget.email,
              'otp': pinController.text,
            },
          );
        } else if (state is ForgotPasswordSuccess) {
          // Resend success
          CustomSnackBar.showSuccess(state.message);
          _startTimer();
        } else if (state is ForgotPasswordError) {
          CustomSnackBar.showError(state.errorModel.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                const OtpHeader(),
                SizedBox(height: 32.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Pinput(
                    length: 6,
                    controller: pinController,
                    focusNode: focusNode,
                    defaultPinTheme: pinTheme,
                    focusedPinTheme: pinTheme,
                    submittedPinTheme: pinTheme,
                    mainAxisAlignment: MainAxisAlignment.center,
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: 48.h),
                BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: pinController.text.length == 6 &&
                              state is! ForgotPasswordLoading
                          ? () {
                              context.read<ForgotPasswordCubit>().verifyOtp(
                                    widget.email,
                                    pinController.text,
                                  );
                            }
                          : null,
                      child: state is ForgotPasswordLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(AppStrings.verify),
                    );
                  },
                ),
                SizedBox(height: 32.h),
                OtpTimer(
                  time: TimeFormatter.formatSeconds(_startSeconds),
                  canResend: _canResend,
                  onResend: () {
                    context
                        .read<ForgotPasswordCubit>()
                        .forgotPassword(widget.email);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
