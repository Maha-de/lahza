import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_state.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_model.dart';
import 'package:lahza/features/buy_phone/widgets/phone_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final favoriteCubit = context.read<FavoriteCubit>();
      if (favoriteCubit.state is! FavoriteLoading &&
          favoriteCubit.favoriteProducts.isEmpty) {
        favoriteCubit.getFavorites();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.favirote),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            final cubit = context.read<FavoriteCubit>();

            switch (state) {
              case FavoriteLoading():
                if (cubit.favoriteProducts.isNotEmpty) {
                  return _buildFavoritesList(cubit.favoriteProducts);
                }
                return const Center(child: CircularProgressIndicator());

              case FavoriteError():
                return Center(child: Text(state.errorModel.errorMessage));

              case FavoriteSuccess():
                if (state.favorites.isEmpty) {
                  return const Center(child: Text('No Favorite Phones'));
                }
                return _buildFavoritesList(state.favorites);

              case FavoriteInitial():
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
  Widget _buildFavoritesList(List<BuyPhoneFavoriteModel> favoritesList) {
    return ListView.separated(
      itemCount: favoritesList.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final BuyPhoneFavoriteModel phone = favoritesList[index];

        return PhoneCard(
          phoneName: phone.name ?? '',
          phoneStatus: phone.condition ?? '',
          phoneCapacity: phone.storage ?? '',
          price: '${phone.price ?? ''} جنيه',
          image: phone.image ?? '',
          isFavorite: true,
          onFavorite: () {
            final id = phone.id ?? '';

            context.read<FavoriteCubit>().toggleFavorite(
              id,
              context.read<BuyPhoneCubit>(),
            );
          },
          onDetails: () {
            Navigator.pushNamed(
              context,
              AppRoutes.buyPhoneDetailsScreen,
              arguments: phone.id,
            );
          },
        );
      },
    );
  }
}