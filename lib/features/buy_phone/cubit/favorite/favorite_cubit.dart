import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_state.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_status_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';
import 'package:lahza/features/buy_phone/repositories/buy_phone_repository.dart';

@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final BuyPhoneRepository repository;

  FavoriteCubit({required this.repository}) : super(FavoriteInitial());

  List<BuyPhoneFavoriteModel> favoriteProducts = [];
  final Map<String, bool> favorites = {};
  bool isInitialized = false;
  Future<void> getFavorites() async {
    if (isInitialized) return;

    emit(FavoriteLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getFavorites(),
    );

    if (response is ErrorBaseResponse<BuyPhoneFavoriteResponse>) {
      emit(FavoriteError(errorModel: response.errorModel));
      return;
    }

    final success = response as SuccessBaseResponse<BuyPhoneFavoriteResponse>;
    favoriteProducts = success.data.data ?? [];

    favorites.clear();
    for (final e in favoriteProducts) {
      if (e.id != null) favorites[e.id!] = true;
    }

    isInitialized = true;
    emit(FavoriteSuccess(favorites: List.from(favoriteProducts)));
  }

  Future<void> toggleFavorite(
    String id,
    BuyPhoneCubit buyPhoneCubit, {
    BuyPhoneModel? phoneModel,
  }) async {
    final oldValue = favorites[id] ?? false;
    final newValue = !oldValue;

    favorites[id] = newValue;
    buyPhoneCubit.updateFavorite(id, newValue);
    if (!newValue) {
      favoriteProducts.removeWhere((product) => product.id == id);
    } else if (phoneModel != null) {
      final exists = favoriteProducts.any((product) => product.id == id);
      if (!exists) {
        final variant = phoneModel.variants?.isNotEmpty == true
            ? phoneModel.variants!.first
            : null;

        int? safePrice;
        if (variant?.price != null) {
          safePrice =
              int.tryParse(variant!.price.toString()) ??
              (variant.price as num).toInt();
        }

        favoriteProducts.add(
          BuyPhoneFavoriteModel(
            id: phoneModel.id,
            name: phoneModel.name,
            condition: phoneModel.condition,
            storage: variant?.storage,
            price: safePrice,
            image: phoneModel.images?.isNotEmpty == true
                ? phoneModel.images!.first
                : '',
          ),
        );
      }
    }
    emit(FavoriteSuccess(favorites: List.from(favoriteProducts)));
    final response = await ErrorHandler.handleApiCall(
      () => repository.toggleFavorite(id),
    );

    if (response is ErrorBaseResponse<BuyPhoneFavoriteStatusResponse>) {
      favorites[id] = oldValue;
      buyPhoneCubit.updateFavorite(id, oldValue);
      if (oldValue) {
        isInitialized = false;
        await getFavorites();
      } else {
        favoriteProducts.removeWhere((product) => product.id == id);
        emit(FavoriteSuccess(favorites: List.from(favoriteProducts)));
      }
    }
  }
}
