import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/di/di.dart';
import 'package:lahza/features/offers/cubit/offers_cubit.dart';
import 'package:lahza/features/offers/cubit/offers_state.dart';
import 'package:lahza/features/offers/repositories/offers_repository.dart';
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
  int selectedIndex = 0;

  final PageController _pageController = PageController();
  Timer? _timer;
  bool _timerStarted = false;

  List<Data> displayList = [];

  void _startAutoPageSwitch(int itemCount) {
    if (itemCount <= 1) return;

    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 3),
          (_) {
        if (!_pageController.hasClients) return;

        final currentPage = _pageController.page?.round() ?? 0;

        if (currentPage >= itemCount - 1) {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }


  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OffersCubit(repository: getIt<OffersRepository>())..fetchOffers(),
      child: Scaffold(
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
                  displayList = state.offersModel;

                  if (!_timerStarted) {
                    _timerStarted = true;
                    _startAutoPageSwitch(displayList.length);
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image Slider
                      SizedBox(
                        height: 200.h,
                        child: PageView.builder(
                          key: ValueKey(displayList.length),
                          controller: _pageController,
                          itemCount: displayList.length,
                          itemBuilder: (context, index) {
                            final item = displayList[index];
                            return
                            OfferInfoCard(
                              key: ValueKey(item.id),
                              item: item,
                              isSlider: true,
                            );

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
      ),
    );
  }
}
