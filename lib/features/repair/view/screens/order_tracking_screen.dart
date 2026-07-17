import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';
import 'package:lahza/features/repair/view/widgets/courier_info_card.dart';
import 'package:lahza/features/repair/view/widgets/courier_status_card.dart';
import 'package:lahza/features/repair/view/widgets/tracking_note_card.dart';
import 'package:lahza/features/repair/view/widgets/tracking_stats_card.dart';

class OrderTrackingScreen extends StatelessWidget {
  final TrackModel track;
  final RepairFlow flow;

  const OrderTrackingScreen({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTechnician = flow == RepairFlow.technician;

    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.orderTrackingTitle,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          children: [
            /// الحالة
            CourierStatusCard(
              track: track,
              flow: flow,
            ),

            SizedBox(height: 16.h),

            /// مكان الخريطة
            ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: Container(
                width: double.infinity,
                height: 220.h,
                color: Colors.grey.shade200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 90.r,
                      color: Colors.grey.shade400,
                    ),

                    Positioned(
                      top: 18.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        child: Text(
                          isTechnician
                              ? "موقع الفني"
                              : "موقع المندوب",
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 28.h,
                      child: Icon(
                        isTechnician
                            ? Icons.handyman
                            : Icons.delivery_dining,
                        color: Colors.red,
                        size: 42.r,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 18.h),

            /// بيانات الفني أو المندوب
            CourierInfoCard(
              track: track,
              flow: flow,
            ),

            SizedBox(height: 18.h),

            /// الوقت والمسافة
            TrackingStatsCard(
              track: track,
              flow: flow,
            ),

            SizedBox(height: 18.h),

            /// الملاحظات
            TrackingNoteCard(
              flow: flow,
            ),

            SizedBox(height: 24.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (flow == RepairFlow.center) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.orderTimeLine,
                      arguments: {
                        'track': track,
                        'flow': flow,
                      },
                    );
                  } else {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.confirmTechnicianArrival,
                      arguments: {
                        'repairId': track.id,
                      },
                    );
                  }
                },
                child: const Text(
                  AppStrings.trackOrderStatus,
                ),
              ),
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}