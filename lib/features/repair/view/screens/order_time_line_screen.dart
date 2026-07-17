import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_error_state.dart';
import 'package:lahza/features/repair/cubit/order_timeline/order_timeline_cubit.dart';
import 'package:lahza/features/repair/cubit/order_timeline/order_timeline_state.dart';
import 'package:lahza/features/repair/models/responses/track_model.dart';
import 'package:lahza/features/repair/view/enums/repair_flow.dart';

import '../widgets/custom_status_card.dart';
import '../widgets/order_time_line_item.dart';

class OrderTimeLineScreen extends StatefulWidget {
  final TrackModel track;
  final RepairFlow flow;

  const OrderTimeLineScreen({
    super.key,
    required this.track,
    required this.flow,
  });

  @override
  State<OrderTimeLineScreen> createState() => _OrderTimeLineScreenState();
}

class _OrderTimeLineScreenState extends State<OrderTimeLineScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    final cubit = context.read<OrderTimelineCubit>();

    cubit.getTimeline(widget.track.id!);

    _timer = Timer.periodic(
      const Duration(minutes: 5),
          (_) => cubit.getTimeline(widget.track.id!),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.orderStatusTitle,
        iconLeading: Icons.check,
        onLeadingPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.mainLayout,
            (route) => false,
          );
        },
      ),
      body: BlocBuilder<OrderTimelineCubit, OrderTimelineState>(
        builder: (context, state) {
          switch (state) {
            case OrderTimelineLoading():
              return const Center(
                child: CircularProgressIndicator(),
              );

            case OrderTimelineError():
              return CustomErrorState(
                message: state.errorModel.errorMessage,
                onRetry: () => context
                    .read<OrderTimelineCubit>()
                    .getTimeline(widget.track.id!),
              );

            case OrderTimelineSuccess():
              final track = state.track;
              final timeline = track.timeline ?? [];

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),

                    OrderStatusCard(
                      track: track,
                      flow: widget.flow,
                    ),

                    SizedBox(height: 24.h),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: timeline.length,
                      itemBuilder: (_, index) {
                        return OrderTimelineItem(
                          item: timeline[index],
                          isLast: index == timeline.length - 1,
                        );
                      },
                    ),
                  ],
                ),
              );

            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}