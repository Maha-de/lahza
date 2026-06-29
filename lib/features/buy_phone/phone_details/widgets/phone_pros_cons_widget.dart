import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';

class PhoneProsConsWidget extends StatelessWidget {
  const PhoneProsConsWidget({
    super.key,
    required this.title,
    required this.items,
    required this.color,
    required this.icon,
  });

  final String title;
  final List<String> items;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.primary14400.copyWith(color: color)),

          SizedBox(height: 5.h),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Icon(icon, color: color, size: 16.sp),
                  SizedBox(width: 5.w),

                  Expanded(
                    child: Text(
                      items[index],
                      style: AppTextStyles.gray9400,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
