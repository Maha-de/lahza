import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_state.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_cubit.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';
import 'package:lahza/features/buy_phone/view/widgets/brand_item.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_card.dart';

class BuyPhoneScreen extends StatefulWidget {
  const BuyPhoneScreen({super.key});
  @override
  State<BuyPhoneScreen> createState() => _BuyPhoneScreenState();
}

class _BuyPhoneScreenState extends State<BuyPhoneScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final buyPhoneCubit = context.read<BuyPhoneCubit>();
      final favoriteCubit = context.read<FavoriteCubit>();
      await favoriteCubit.getFavorites();
      await buyPhoneCubit.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.buyPhone),
      body: BlocBuilder<BuyPhoneCubit, BuyPhoneState>(
        builder: (context, state) {
          final cubit = context.read<BuyPhoneCubit>();

          switch (state) {
            case BuyPhoneLoading():
              return const Center(child: CircularProgressIndicator());

            case BuyPhoneError():
              return Center(child: Text(state.errorModel.errorMessage));

            case BuyPhoneSuccess():
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                children: [
                  SizedBox(
                    height: 75.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.brands.length,
                      separatorBuilder: (_, _) => SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        return BrandItem(
                          brandName: cubit.brands[index],
                          isSelected: selectedIndex == index,
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            cubit.filterByBrand(cubit.brands[index]);
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    AppStrings.avilablaPhones,
                    style: AppTextStyles.primaryDark16500,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.exploreRecentPhones,
                    style: AppTextStyles.gray14400,
                  ),
                  SizedBox(height: 28.h),
                  if (state.data.isEmpty)
                    const Center(child: Text('No Phones Found'))
                  else
                    ...state.data.map((BuyPhoneModel phone) {
                      final variant = phone.variants?.isNotEmpty == true
                          ? phone.variants!.first
                          : null;

                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: PhoneCard(
                          phoneName: phone.name ?? '',
                          phoneStatus: phone.condition ?? '',
                          phoneCapacity: variant?.storage ?? '',
                          price: variant != null ? '${variant.price} جنيه' : '',
                          image: phone.images?.isNotEmpty == true
                              ? phone.images!.first
                              : '',
                          isFavorite: phone.isFavorite,
                          onFavorite: () {
                            context.read<FavoriteCubit>().toggleFavorite(
                              phone.id ?? '',
                              context.read<BuyPhoneCubit>(),
                              phoneModel: phone,
                            );
                          },
                          onDetails: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.buyPhoneDetailsScreen,
                              arguments: {'id': phone.id},
                            );
                          },
                        ),
                      );
                    }),
                ],
              );

            case BuyPhoneInitial():
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
