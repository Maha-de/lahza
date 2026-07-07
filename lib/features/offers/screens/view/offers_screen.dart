import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/features/offers/cubit/offers_cubit.dart';
import 'package:lahza/features/offers/cubit/offers_state.dart';
import 'package:lahza/features/offers/screens/widgets/offer_info_card.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import 'package:lahza/features/offers/models/offers_model.dart';


class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  // final List<String> images = [
  //   'assets/images/offer.png',
  //   'assets/images/fix_camera.png',
  //   'assets/images/exchange_battery.png',
  // ];
  int selectedIndex = 0;

  final PageController _pageController = PageController();
  late Timer _timer;
  List<Data> displayList = [];

  void _startAutoPageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page?.toInt() == displayList.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void initState() {
    // _startAutoPageSwitch();
    context.read<OffersCubit>().fetchOffers();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.offers),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<OffersCubit, OffersState>(
          builder: (context, state) {
            switch (state) {
              case OffersLoading _:
                return const Center(child: CircularProgressIndicator());

              case OffersError _:
                return Center(child: Text(state.errorModel.errorMessage));

              case OffersSuccess _:
                // final displayList = state.offersModel;
              displayList = state.offersModel;
              _startAutoPageSwitch();
              
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image Slider
                    SizedBox(
                      height: 200.h,
                      child:


                      // PageView.builder(
                      //   controller: _pageController,
                      //   itemCount: images.length,
                      //   itemBuilder: (context, index) {
                      //     return Image.asset(
                      //       images[index],
                      //       fit: BoxFit.fill,
                      //       height: 200.h,
                      //     );
                      //   },
                      // ),
                      PageView.builder(
                        controller: _pageController,
                        itemCount: displayList.length,
                        itemBuilder: (context, index) {
                          return OfferInfoCard(item: displayList[index],);
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 12.h),
                      itemCount: displayList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return OfferInfoCard(
                          titleStyle: AppTextStyles.primaryDark14500,
                          valueStyle: AppTextStyles.gray14500,
                          item: displayList[index],
                        );
                      },
                    ),
                  ],
                );
              case OffersInitial _:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
