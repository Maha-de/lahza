import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/services/notification_service.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/offer_banner.dart';
import 'package:lahza/features/main_layout/home/service_card.dart';
import 'package:lahza/features/main_layout/home/welcome_banner.dart';
import 'package:lahza/features/main_layout/home/welcome_dialog.dart';
import 'package:lahza/features/notifications/cubit/fcm_token_cubit.dart';
import 'package:lahza/features/notifications/cubit/notifications_cubit.dart';

void onServiceTap(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.pushNamed(context, AppRoutes.issueType);
      break;

    case 1:
      // تقييم الهواتف
      Navigator.pushNamed(context, AppRoutes.reviewPhones);

      break;

    case 2:
      // متابعة الطلبات
      Navigator.pushNamed(context, AppRoutes.myOrders);
      break;

    case 3:
      // شراء هاتف
      Navigator.pushNamed(context, AppRoutes.buyPhone);

      break;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late StreamSubscription _notificationSubscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const WelcomeDialog(),
      );
    });
    //
    // _notificationSubscription = NotificationService.notificationStream.stream.listen((message) {
    //   // تحديث البيانات
    //   context.read<NotificationsCubit>().fetchNotifications();
    //
    //   // إظهار التنبيه للمستخدم
    //   if (message.notification != null) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text("لديك إشعار جديد: ${message.notification?.title}"),
    //       ),
    //     );
    //   }
    // });

    // context.read<FcmTokenCubit>().sendFcmTokenToServer();
  }

  @override
  void dispose() {
    _notificationSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.appName,
        icon: Icons.notifications_sharp,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeBanner(),

            SizedBox(height: 16.h),

            Text(
              AppStrings.servicesTitle,
              style: AppTextStyles.primaryDark22500,
            ),

            SizedBox(height: 16.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ServiceCardData.services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                final service = ServiceCardData.services[index];

                return ServiceCard(
                  title: service.title,
                  description: service.description,
                  icon: service.icon,
                  onTap: () => onServiceTap(context, index),
                );
              },
            ),

            SizedBox(height: 16.h),

            const ExclusiveOfferBanner(),
          ],
        ),
      ),
    );
  }
}
