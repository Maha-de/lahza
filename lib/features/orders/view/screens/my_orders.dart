import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/orders/cubit/my_orders_cubit.dart';
import 'package:lahza/features/orders/cubit/my_orders_state.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';
import 'package:lahza/features/orders/view/widgets/my_orders_card.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int _currentFilter = 0;


  final filters = [
    {"title": "الكل", "status": null},
    {"title": "قيد التنفيذ", "status": Status.PENDING},
    {"title": "مكتمل", "status": Status.COMPLETED},
    {"title": "ملغي", "status": Status.CANCELLED},
  ];

  List<Data> filteredOrders(List<Data> orders) {
    switch (_currentFilter) {
      case 1:
        return orders.where((e) => e.status == Status.PENDING).toList();

      case 2:
        return orders.where((e) => e.status == Status.COMPLETED).toList();

      case 3:
        return orders.where((e) => e.status == Status.CANCELLED).toList();

      default:
        return orders;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<MyOrdersCubit>().fetchMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.myOrders),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            switch (state) {
              case MyOrdersLoading _:
                return const Center(child: CircularProgressIndicator());

              case MyOrdersError _:
                return Center(child: Text(state.errorModel.errorMessage));

              case MyOrdersSuccess _:
                // final displayList = isSearching ? searchResult : state.data;
                final displayList = filteredOrders(state.myOrdersModel);

                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  filters[index]["title"] as String,                                  style: _currentFilter == index
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
                      itemCount: displayList.length,

                      // itemCount: MyOrdersItem.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyOrdersCard(
                          titleStyle: AppTextStyles.primaryDark14500,
                          valueStyle: AppTextStyles.gray14500,
                          item: displayList[index],

                          // item: MyOrdersItem.items[index],
                        );
                      },
                    ),
                  ],
                );
              case MyOrdersInitial _:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
