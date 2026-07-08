import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_keys.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/buy_phone/api_client/buy_phone_api_client.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_details_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_status_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_response.dart';

@LazySingleton()
class BuyPhoneRepository {
  final BuyPhoneApiClient apiClient;

  BuyPhoneRepository({required this.apiClient});

  static const Duration _productsCacheDuration = Duration(days: 5);
  static const Duration _detailsCacheDuration = Duration(days: 3);

  Future<BuyPhoneResponse> getProducts() async {
    final cachedData = CacheHelper.getData(key: AppKeys.productsCache);
    final cachedTime = CacheHelper.getData(key: AppKeys.productsCacheTime);

    if (cachedData != null && cachedTime != null) {
      final savedTime = DateTime.parse(cachedTime);

      if (DateTime.now().difference(savedTime) < _productsCacheDuration) {
        return BuyPhoneResponse.fromJson(jsonDecode(cachedData));
      }
    }

    final response = await apiClient.getProducts();

    await CacheHelper.saveData(
      key: AppKeys.productsCache,
      value: jsonEncode(response.toJson()),
    );

    await CacheHelper.saveData(
      key: AppKeys.productsCacheTime,
      value: DateTime.now().toIso8601String(),
    );

    return response;
  }

  Future<BuyPhoneDetailsResponse> getProductById(String id) async {
    final cacheKey = '${AppKeys.phoneDetailsCache}_$id';
    final timeKey = '${AppKeys.phoneDetailsCacheTime}_$id';

    final cachedData = CacheHelper.getData(key: cacheKey);
    final cachedTime = CacheHelper.getData(key: timeKey);

    if (cachedData != null && cachedTime != null) {
      final savedTime = DateTime.parse(cachedTime);

      if (DateTime.now().difference(savedTime) < _detailsCacheDuration) {
        return BuyPhoneDetailsResponse.fromJson(jsonDecode(cachedData));
      }
    }

    final response = await apiClient.getProductById(id);

    await CacheHelper.saveData(
      key: cacheKey,
      value: jsonEncode(response.toJson()),
    );

    await CacheHelper.saveData(
      key: timeKey,
      value: DateTime.now().toIso8601String(),
    );

    return response;
  }

  Future<void> updateCachedFavorite(String id, bool isFavorite) async {
    /// Products cache
    final productsCache = CacheHelper.getData(key: AppKeys.productsCache);

    if (productsCache != null) {
      final products = BuyPhoneResponse.fromJson(jsonDecode(productsCache));

      final product = products.data?.firstWhere(
        (e) => e.id == id,
        orElse: () => throw Exception(),
      );

      if (product != null) {
        product.isFavorite = isFavorite;

        await CacheHelper.saveData(
          key: AppKeys.productsCache,
          value: jsonEncode(products.toJson()),
        );
      }
    }

    /// Details cache
    final detailsKey = '${AppKeys.phoneDetailsCache}_$id';
    final detailsCache = CacheHelper.getData(key: detailsKey);

    if (detailsCache != null) {
      final details = BuyPhoneDetailsResponse.fromJson(
        jsonDecode(detailsCache),
      );

      details.data?.isFavorite = isFavorite;

      await CacheHelper.saveData(
        key: detailsKey,
        value: jsonEncode(details.toJson()),
      );
    }
  }

  Future<BuyPhoneFavoriteResponse> getFavorites() {
    return apiClient.getFavorites();
  }

  Future<BuyPhoneFavoriteStatusResponse> toggleFavorite(String id) {
    return apiClient.toggleFavorite(id);
  }
}
