
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/reviews/widgets/review_phones_item.dart';

class ReviewPhonesCard extends StatelessWidget {
  final ReviewPhonesItem item;
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
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(width: 80.w, child: item.image),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(item.title, style: AppTextStyles.primary16500),
                  SizedBox(height: 4.h),
                  Text(item.subtitle!, style: AppTextStyles.gray9500),
                  SizedBox(height: 4.h),

                ],
              ),
            ),

            Expanded(
              child: Row(
                children: [

                  Icon(Icons.star, color: Colors.yellow,),
                  SizedBox(width: 10.h,),
                  Text("4"),

                ],
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        
      },
    );
  }
}
