import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/helpers/time_formatter.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/forget_password/otp_header.dart';
import 'package:lahza/features/forget_password/otp_timer.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

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
    return Scaffold(
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
                  length: 4,
                  controller: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: pinTheme,
                  focusedPinTheme: pinTheme,
                  submittedPinTheme: pinTheme,
                  mainAxisAlignment: MainAxisAlignment.center,

                  onChanged: (_) {
                    setState(() {});
                  },

                  onCompleted: (pin) {
                    debugPrint(pin);
                  },
                ),
              ),

              SizedBox(height: 48.h),
              ElevatedButton(
                onPressed: pinController.text.length == 4
                    ? () {
                  Navigator.pushNamed(context, AppRoutes.createNewPassword);
                }
                    : null,
                child: const Text(AppStrings.verify),
              ),

              SizedBox(height: 32.h),

              OtpTimer(
                time: TimeFormatter.formatSeconds(_startSeconds),
                canResend: _canResend,
                onResend: _startTimer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
