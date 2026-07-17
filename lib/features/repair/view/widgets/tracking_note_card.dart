import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_card.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

class TrackingNoteCard extends StatelessWidget {
  final RepairFlow flow;

  const TrackingNoteCard({
    super.key,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    return CustomCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: AppColors.bannerBackground,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.info_outline,
              color: AppColors.primary,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ملاحظة",
                  style: AppTextStyles.primaryDark14500,
                ),

                SizedBox(height: 6.h),

                Text(
                  isTechnician
                      ? "الفني في طريقه إليك الآن. يُرجى التأكد من أن الهاتف جاهز للفحص والإصلاح، وفي حالة تعذر الوصول سيتم التواصل معك هاتفيًا."
                      : "المندوب في طريقه لاستلام جهازك. يُرجى تجهيز الجهاز وإرفاق أي ملحقات مطلوبة لتسريع عملية الاستلام.",
                  style: AppTextStyles.gray14400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}