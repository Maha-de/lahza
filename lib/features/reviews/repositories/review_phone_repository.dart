import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/reviews/models/review_phone_details_model.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'dart:convert';

import 'package:lahza/features/reviews/repositories/data_source/reviews_client.dart';


@LazySingleton()
class ReviewsRepository {
  final ReviewsClient client;

  ReviewsRepository({required this.client});

  Future<ReviewPhonesModel> getReviews() async {
    try {
      final response = await client.getReviews();

      await CacheHelper.saveData(key: 'cached_reviews', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_reviews');
      if (cachedData != null) {
        return ReviewPhonesModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

  Future<ReviewPhoneDetailsModel> getProductDetails(String id) async {
    try {
      final response = await client.getProductDetails(id);

      await CacheHelper.saveData(key: 'cached_reviews_details', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_reviews_details');
      if (cachedData != null) {
        return ReviewPhoneDetailsModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

}