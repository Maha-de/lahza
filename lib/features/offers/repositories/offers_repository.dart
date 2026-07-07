import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/offers/api_client/offers_client.dart';
import 'package:lahza/features/offers/models/offers_model.dart';
import 'dart:convert';


@LazySingleton()
class OffersRepository {
  final OffersClient client;

  OffersRepository({required this.client});

  Future<OffersModel> getOffers() async {
    try {
      final response = await client.getOffers();

      await CacheHelper.saveData(key: 'cached_offers', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_offers');
      if (cachedData != null) {
        return OffersModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }


}