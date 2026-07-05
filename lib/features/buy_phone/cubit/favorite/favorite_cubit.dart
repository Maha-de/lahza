import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_cubit.dart';
import 'package:lahza/features/buy_phone/cubit/favorite/favorite_state.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_status_response.dart';
import 'package:lahza/features/buy_phone/repositories/buy_phone_repository.dart';

@lazySingleton
class FavoriteCubit extends Cubit<FavoriteState> {
  final BuyPhoneRepository repository;

  FavoriteCubit({required this.repository}) : super(FavoriteInitial()) {
    debugPrint("FavoriteCubit CREATED = $hashCode");
  }

  @override
  Future<void> close() {
    debugPrint("========== FavoriteCubit CLOSED ==========");

    return super.close();
  }

  List<BuyPhoneFavoriteModel> favoriteProducts = [];
  final Map<String, bool> favorites = {};
  bool isFavorite(String id) => favorites[id] ?? false;
  Future<void> getFavorites() async {
    debugPrint("getFavorites() start - isClosed: $isClosed");

    debugPrint("emit FavoriteLoading - isClosed: $isClosed");

    emit(FavoriteLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getFavorites(),
    );

    debugPrint("getFavorites() response - isClosed: $isClosed");

    if (response is ErrorBaseResponse<BuyPhoneFavoriteResponse>) {
      debugPrint("emit FavoriteError - isClosed: $isClosed");

      emit(FavoriteError(errorModel: response.errorModel));

      return;
    }

    final success = response as SuccessBaseResponse<BuyPhoneFavoriteResponse>;

    debugPrint("favorites count = ${success.data.data?.length}");

    favoriteProducts = success.data.data ?? [];

    favorites
      ..clear()
      ..addEntries(
        favoriteProducts
            .where((e) => e.id != null)
            .map((e) => MapEntry(e.id!, true)),
      );

    debugPrint("emit FavoriteSuccess - isClosed: $isClosed");

    emit(FavoriteSuccess(favorites: List.from(favoriteProducts)));
  }

  Future<void> toggleFavorite(String id, BuyPhoneCubit buyPhoneCubit) async {
    debugPrint("toggleFavorite() start - isClosed: $isClosed");

    final oldValue = favorites[id] ?? false;
    final newValue = !oldValue;

    favorites[id] = newValue;

    buyPhoneCubit.updateFavorite(id, newValue);

    if (!newValue) {
      favoriteProducts.removeWhere((product) => product.id == id);
    }

    debugPrint("emit FavoriteSuccess(toggle) - isClosed: $isClosed");
    emit(FavoriteSuccess(favorites: List.from(favoriteProducts)));

    final response = await ErrorHandler.handleApiCall(
      () => repository.toggleFavorite(id),
    );

    debugPrint("toggleFavorite() response - isClosed: $isClosed");

    if (response is ErrorBaseResponse<BuyPhoneFavoriteStatusResponse>) {
      favorites[id] = oldValue;
      buyPhoneCubit.updateFavorite(id, oldValue);

      await getFavorites();
      return;
    }
  }

  Future<void> refreshFavorites() async {
    await getFavorites();
  }
}
