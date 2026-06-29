import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';

import '../box_content_model.dart';

class BoxContentWidget extends StatelessWidget {
  const BoxContentWidget({
    super.key,
    required this.items,
  });

  final List<BoxContentModel> items;

  static const List<IconData> _icons = [
    Icons.smartphone_outlined,
    Icons.usb_outlined,
    Icons.menu_book_outlined,
    Icons.workspace_premium_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final item = items[index];

          return CustomContainer(
            width: 82.w,
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 12.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _icons[index],
                  color: AppColors.primary,
                  size: 28.sp,
                ),

                SizedBox(height: 10.h),

                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.gray12400.copyWith(
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}