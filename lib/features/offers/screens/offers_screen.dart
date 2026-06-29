import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/features/Offers/widgets/offer_info_card.dart';
import 'package:lahza/features/Offers/widgets/offer_info_item.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_bar_widget.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final List<String> images = [
    'assets/images/offer.png',
    'assets/images/fix_camera.png',
    'assets/images/exchange_battery.png',

  ];
  int selectedIndex = 0;

  PageController _pageController = PageController();
  late Timer _timer;

  void _startAutoPageSwitch() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page?.toInt() == images.length - 1) {
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
    // TODO: implement initState
    _startAutoPageSwitch();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.offers),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Slider
            Container(
              height: 200.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                    height: 200.h,
                  );

                },
              ),
            ),

            SizedBox(height: 10.h),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 12.h),
              itemCount: OfferInfoItem.items.length,
              itemBuilder: (BuildContext context, int index) {
                return OfferInfoCard(
                                    titleStyle: AppTextStyles.primaryDark14500,
                                    valueStyle: AppTextStyles.gray14500,
                                    item: OfferInfoItem.items[index],
                                  );
              },

            ),



          ],
        ),
      ),
    );
  }
}

