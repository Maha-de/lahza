import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/network/api_consumer.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'dart:convert';

@LazySingleton()
class ReviewsRepository {
  final ApiConsumer api;

  ReviewsRepository({required this.api});

  Future<ReviewPhonesModel> getReviews() async {
    try {
      final response = await api.get(AppEndPoints.getAllReviews);
      final model = ReviewPhonesModel.fromJson(response);

      await CacheHelper.saveData(key: 'cached_reviews', value: jsonEncode(response));

      return model;

    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_reviews');

      if (cachedData != null) {
        return ReviewPhonesModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }
}