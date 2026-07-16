import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/notifications/cubit/notifications_cubit.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';
import 'package:intl/intl.dart' as intl;


class NotificationCard extends StatelessWidget {
  final NotificationsModel item;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final TextStyle? subtitleStyle;

  const NotificationCard({
    super.key,
    required this.item,
    this.titleStyle,
    this.valueStyle,
    this.subtitleStyle,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //   width: 60.w,
              //   height: 60.h,
              //   decoration: BoxDecoration(
              //     color: AppColors.bannerBackground,
              //     shape: BoxShape.circle,
              //   ),
              //   // child: Icon(item.icon, color: AppColors.primary),
              // ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(item.title ?? "", style: AppTextStyles.primary16500),
                    SizedBox(height: 4.h),

                    Text(item.body ?? "", style: AppTextStyles.gray14400),
                    SizedBox(height: 4.h),
                    Text(
                      item.createdAt != null
                          ? intl.DateFormat(
                        'dd/MM/yyyy – HH:mm',
                      ).format(item.createdAt!)
                          : 'لا يوجد تاريخ',
                      style: AppTextStyles.gray9500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              IconButton(

                onPressed: () {
                    context.read<NotificationsCubit>().markAsRead(item.id!);

                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
          if (item.isRead == false)
            Positioned(
              right: 0,
              top: 20,
              child: Container(
                width: 12.w,
                height: 12.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
