import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/orders/widgets/my_orders_card.dart';
import 'package:lahza/features/orders/widgets/my_orders_item.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {

  int _currentFilter = 0;

  final List<String> filters = ["الكل", "قيد التنفيذ", "مكتمل", "ملغي"];

  List<MyOrdersItem> get filteredOrders {
    switch (_currentFilter) {
      case 1:
        return MyOrdersItem.items
            .where((e) => e.status == "قيد التنفيذ")
            .toList();

      case 2:
        return MyOrdersItem.items.where((e) => e.status == "مكتمل").toList();

      case 3:
        return MyOrdersItem.items.where((e) => e.status == "ملغي").toList();

      default:
        return MyOrdersItem.items;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.myOrders),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: List.generate(
                  filters.length,
                  (index) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentFilter = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _currentFilter == index
                              ? AppColors.primaryDark
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          filters[index],
                          style: _currentFilter == index
                              ? AppTextStyles.white16500
                              : AppTextStyles.gray16500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30.h),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 12.h),
              itemCount: filteredOrders.length,

              // itemCount: MyOrdersItem.items.length,
              itemBuilder: (BuildContext context, int index) {
                return MyOrdersCard(
                  titleStyle: AppTextStyles.primaryDark14500,
                  valueStyle: AppTextStyles.gray14500,
                  item: filteredOrders[index],

                  // item: MyOrdersItem.items[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
