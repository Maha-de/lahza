import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/courier_info_card.dart';

import 'package:lahza/features/main_layout/home/repair/issue_type/courier_status_card.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/tracking_note_card.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/tracking_stats_card.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.orderTrackingTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            const CourierStatusCard(),

            SizedBox(height: 16.h),

            /// Map Card
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Container(
                width: double.infinity,
                height: 160.h,
                color: Colors.grey.shade200,
                child: const Center(child: Text('Map Here')),
              ),
            ),

            SizedBox(height: 16.h),

            const CourierInfoCard(),

            SizedBox(height: 16.h),

            const TrackingStatsCard(),

            SizedBox(height: 16.h),

            const TrackingNoteCard(),

            SizedBox(height: 24.h),

            ElevatedButton(
              child: Text(AppStrings.trackOrderStatus),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.orderTimeLine);
              },
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
