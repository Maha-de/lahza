import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/notifications/widgets/notification_card.dart';
import 'package:lahza/features/notifications/widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: AppStrings.notifications,
          iconLeading: Icons.more_horiz,
          menuItems: const [

            PopupMenuItem(
              value: 'read',
              child: const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.delete_outline, color: Colors.red,),
                title: Text('مسح الكل', style: TextStyle(color: Colors.red,)),
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.check),
                  title: Text('قراءة الكل'),
            ),
            ),
          ],
          onMenuSelected: (value) {
            if (value == 'read') {
              // تم القراءة
            } else if (value == 'delete') {
              // حذف
            }
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.r),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 12.h),
              itemCount: NotificationItem.items.length,

              // itemCount: MyOrdersItem.items.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationCard(
                  titleStyle: AppTextStyles.primaryDark14500,
                  valueStyle: AppTextStyles.gray14500,
                  item: NotificationItem.items[index],

                );
              },
            ),
          ],
        ),

    )
    );
  }
}
