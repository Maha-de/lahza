import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/offers/models/offers_model.dart';
import 'end_date_timer_widget.dart';

class OfferInfoCard extends StatefulWidget {
  final Data item;
  final bool isSlider;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const OfferInfoCard({
    super.key,
    required this.item,
    this.isSlider = false,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });

  @override
  State<OfferInfoCard> createState() => _OfferInfoCardState();
}

class _OfferInfoCardState extends State<OfferInfoCard> {
  @override
  Widget build(BuildContext context) {
    return widget.isSlider ? _buildSliderLayout() : _buildListLayout();
  }

  Widget _buildListLayout() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.white90.withValues(alpha: 0.12),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 80.w,
              child: Image.network(widget.item.image, fit: BoxFit.cover),
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.title, style: AppTextStyles.primary16500),
                SizedBox(height: 4.h),
                Text(widget.item.description, style: AppTextStyles.gray14500),
                SizedBox(height: 4.h),

                Row(
                  children: [
                    Icon(Icons.access_time_outlined, size: 16),

                    SizedBox(width: 5.w),

                    Expanded(child: EndDateTimerWidget(item: widget.item)),
                  ],
                ),
              ],
            ),
          ),

          Column(

            children: [
              Text(
                "${widget.item.discountValue} %",
                style: AppTextStyles.primaryDark16500,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 90.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // minimumSize: Size(100.w, 35.h),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 6.h,
                    ),
                  ),

                  onPressed: () {},
                  child: Text(
                    "استخدم العرض",
                    style: TextStyle(
                      overflow: TextOverflow.visible,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSliderLayout() {
    return Container(
      height: 100.h,
      width: 400.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: AppColors.bannerBackground,
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(widget.item.image, fit: BoxFit.cover),
            ),

            Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.item.title, style: AppTextStyles.primary16500),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 90.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size(100.w, 35.h),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                    ),

                    onPressed: () {},
                    child: Text(
                      "استخدم العرض",
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
