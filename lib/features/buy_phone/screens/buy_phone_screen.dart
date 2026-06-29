import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/buy_phone/widgets/brand_item.dart';
import 'package:lahza/features/buy_phone/widgets/phone_card.dart';

class BuyPhoneScreen extends StatefulWidget {
  const BuyPhoneScreen({super.key});

  @override
  State<BuyPhoneScreen> createState() => _BuyPhoneScreenState();
}

class _BuyPhoneScreenState extends State<BuyPhoneScreen> {
  final List<String> brands = [
    'All',
    'Apple',
    'Samsung',
    'Huawei',
    'Xiaomi',
    'Oppo',
    'Realme',
  ];

  int selectedIndex = 0;

  final List<bool> favorites = List.generate(10, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.buyPhone),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        children: [
          /// Brands
          SizedBox(
            height: 75.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: brands.length,
              separatorBuilder: (_, _) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return BrandItem(
                  brandName: brands[index],
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
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

          Text(AppStrings.exploreRecentPhones, style: AppTextStyles.gray14400),

          SizedBox(height: 28.h),

          ...List.generate(
            favorites.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: PhoneCard(
                phoneName: "iPhone 16 Pro Max",
                price: "55,000 جنيه",
                image: AppAssets.welcomeBanner,
                phoneStatus: "جديد",
                phoneCapacity: "256 GB",
                isFavorite: favorites[index],
                onFavorite: () {
                  setState(() {
                    favorites[index] = !favorites[index];
                  });
                },
                onDetails: () {
                  Navigator.pushNamed(context, AppRoutes.phoneDetails);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
