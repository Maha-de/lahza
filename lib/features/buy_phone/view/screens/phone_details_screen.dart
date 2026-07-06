import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/buy_phone/cubit/phone_details/phone_details_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/phone_details/phone_details_state.dart';
import 'package:lahza/features/buy_phone/view/widgets/box_contents_widget.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_colors_widget.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_description_widget.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_header_card.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_pros_cons_widget.dart';
import 'package:lahza/features/buy_phone/view/widgets/phone_specs_widget.dart';

class BuyPhoneDetailsScreen extends StatefulWidget {
  const BuyPhoneDetailsScreen({
    super.key,
    required this.productId,
    this.isFavorite = false,
  });

  final String productId;
  final bool isFavorite;

  @override
  State<BuyPhoneDetailsScreen> createState() => _BuyPhoneDetailsScreenState();
}

class _BuyPhoneDetailsScreenState extends State<BuyPhoneDetailsScreen> {
  int selectedColor = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BuyPhoneDetailsCubit>().getProductDetails(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.phoneDetails,
        iconLeading: widget.isFavorite ? Icons.favorite : Icons.favorite_border,
        iconColor: widget.isFavorite ? Colors.red : Colors.grey,
      ),
      body: BlocBuilder<BuyPhoneDetailsCubit, BuyPhoneDetailsState>(
        builder: (context, state) {
          switch (state) {
            case BuyPhoneDetailsInitial():
              return const SizedBox();

            case BuyPhoneDetailsLoading():
              return const Center(child: CircularProgressIndicator());

            case BuyPhoneDetailsError():
              return Center(child: Text(state.errorModel.errorMessage));

            case BuyPhoneDetailsSuccess():
              final product = state.product;
              final variants = product.variants ?? [];

              if (selectedColor >= variants.length && variants.isNotEmpty) {
                selectedColor = 0;
              }

              final selectedVariant = variants.isNotEmpty
                  ? variants[selectedColor]
                  : null;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PhoneHeaderCard(
                      phoneName: product.name ?? '',
                      image: product.images?.isNotEmpty == true
                          ? product.images!.first
                          : '',
                      price: selectedVariant != null
                          ? '${selectedVariant.price} جنيه'
                          : '',
                      phoneStatus: product.condition ?? '',
                      phoneCapacity: selectedVariant?.storage ?? '',
                      rate: product.rating ?? 0,
                    ),

                    SizedBox(height: 20.h),

                    if (variants.isNotEmpty)
                      PhoneColorsWidget(
                        variants: variants,
                        selectedIndex: selectedColor,
                        onTap: (index) {
                          setState(() {
                            selectedColor = index;
                          });
                        },
                      ),

                    SizedBox(height: 16.h),

                    PhoneDescriptionWidget(
                      description: product.description ?? '',
                    ),

                    SizedBox(height: 16.h),

                    if (product.specs != null)
                      PhoneSpecsWidget(specs: product.specs!),

                    SizedBox(height: 16.h),

                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: SizedBox.expand(
                              child: PhoneProsConsWidget(
                                title: "المميزات",
                                color: Colors.green,
                                icon: Icons.check_circle,
                                items: product.features ?? [],
                              ),
                            ),
                          ),

                          SizedBox(width: 8.w),

                          Expanded(
                            child: SizedBox.expand(
                              child: PhoneProsConsWidget(
                                title: "العيوب",
                                color: Colors.red,
                                icon: Icons.remove_circle,
                                items: product.defects ?? [],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      AppStrings.boxContents,
                      style: AppTextStyles.primaryDark15500,
                    ),

                    SizedBox(height: 16.h),

                    BoxContentWidget(items: product.boxContent ?? []),

                    SizedBox(height: 20.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppStrings.callMe),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
