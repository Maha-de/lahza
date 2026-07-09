import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class RatingRow extends StatelessWidget {
  final String label;
  final double value;

  const RatingRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        // نص العنوان
        SizedBox(
          width: 120,
          child: Text(label, style: AppTextStyles.primary14500,
          ),
        ),
        const SizedBox(width: 10),

        // شريط التقدم
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: value / 5,
              backgroundColor: AppColors.grayLight,
              color: AppColors.primary, // اللون الأزرق الغامق
              minHeight: 4,
            ),
          ),
        ),
        const SizedBox(width: 10),

        // التقييم الرقمي
        SizedBox(
          width: 45,
          child: Text("$value\\5", style: AppTextStyles.primary12400),
        ),
      ],
    );
  }
}

