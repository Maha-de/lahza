import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class OtpTimer extends StatelessWidget {
  final String time;
  final bool canResend;
  final VoidCallback onResend;

  const OtpTimer({
    super.key,
    required this.time,
    required this.canResend,
    required this.onResend,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: AppTextStyles.primary16500,
        ),
        GestureDetector(
          onTap: canResend ? onResend : null,
          child: Text(
            AppStrings.resendCode,
            style: AppTextStyles.primary16500,
          ),
        ),
      ],
    );
  }
}