import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/notifications/cubit/notifications_cubit.dart';
import 'package:lahza/features/notifications/cubit/notifications_state.dart';
import 'package:lahza/features/notifications/view/widgets/notification_card.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Data> displayList = [];


  @override
  void initState() {
    super.initState();
    context.read<NotificationsCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.notifications,
        iconLeading: Icons.more_horiz,
        menuItems: const [
          PopupMenuItem(
            value: 'isRead',
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.delete_outline, color: Colors.red),
              title: Text('قراءة الكل', style: TextStyle(color: Colors.red)),
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.check),
              title: Text('مسح الكل'),
            ),
          ),
        ],
        // onMenuSelected: (value) {
        //   if (value == 'read') {
        //     // استدعاء دالة قراءة الكل
        //     context.read<NotificationsCubit>().markAllAsRead();
        //   } else if (value == 'delete') {
        //     // استدعاء دالة حذف الكل
        //     context.read<NotificationsCubit>().deleteAllNotifications();
        //   }
        // },
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          switch (state) {
            case NotificationsLoading _:
              return const Center(child: CircularProgressIndicator());

            case NotificationsError _:
              return Center(child: Text(state.errorModel.errorMessage));

            case NotificationsSuccess _:
              displayList = state.notificationsModel;

              final unreadList = displayList.where((item) => item.isRead == false).toList();
              final readList = displayList.where((item) => item.isRead == true).toList();

              final sortedList = [...unreadList, ...readList];

              return Padding(
                padding: EdgeInsets.all(16.r),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 12.h),
                  itemCount: sortedList.length,

                  itemBuilder: (BuildContext context, int index) {
                    return NotificationCard(
                      titleStyle: AppTextStyles.primaryDark14500,
                      valueStyle: AppTextStyles.gray14500,
                      item: sortedList[index],
                    );
                  },
                ),
              );
            case NotificationsInitial _:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
