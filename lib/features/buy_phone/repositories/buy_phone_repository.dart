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
  static const Duration _detailsCacheDuration = Duration(days: 10);

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

  Future<BuyPhoneFavoriteResponse> getFavorites() {
    return apiClient.getFavorites();
  }

  Future<BuyPhoneFavoriteStatusResponse> toggleFavorite(String id) {
    return apiClient.toggleFavorite(id);
  }
}
