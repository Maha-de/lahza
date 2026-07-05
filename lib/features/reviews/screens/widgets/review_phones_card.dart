import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/rating_bar_widget.dart';
import '../../models/review_phones_model.dart';

class ReviewPhonesCard extends StatelessWidget {
  final Data item;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const ReviewPhonesCard({
    super.key,
    required this.item,
    this.titleStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.white90.withValues(alpha: 0.12),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.ltr,

          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 80.w, child: Image.network(item.image)),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(item.name, style: AppTextStyles.primary16500,textDirection: TextDirection.ltr,),
                  SizedBox(height: 4.h),
                  Text(item.description, style: AppTextStyles.gray9500),
                  SizedBox(height: 4.h),
                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [
                  RatingWidget(rating: item.rating),
                  SizedBox(width: 5.h),
                  Text(item.rating.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        final String selectedId = item.productId.toString();

        print("--- DEBUG SENDER: Sending ID: $selectedId ---");

        Navigator.pushNamed(
          context,
          AppRoutes.phoneDetailsScreen,
          arguments: selectedId,
        );
      },
    );
  }
}
