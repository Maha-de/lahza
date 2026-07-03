import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/network/api_consumer.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'dart:convert';

@LazySingleton()
class ReviewsRepository {
  final ApiConsumer api; // الـ ApiConsumer الخاص بك

  ReviewsRepository({required this.api});

  Future<ReviewPhonesModel> getReviews() async {
    try {
      // 1. محاولة جلب البيانات من الـ API
      final response = await api.get(AppEndPoints.getAllReviews);
      // 2. تحويل الـ Map إلى Model
      final model = ReviewPhonesModel.fromJson(response);

      // 3. حفظ البيانات في الكاش (نقوم بتحويل الـ Object إلى JSON String)
      await CacheHelper.saveData(key: 'cached_reviews', value: jsonEncode(response));

      return model;

    } catch (e) {
      // 4. في حالة حدوث خطأ (مثل لا يوجد إنترنت)، نجلب من الكاش
      final cachedData = CacheHelper.getData(key: 'cached_reviews');

      if (cachedData != null) {
        // إذا وجدنا بيانات في الكاش، نعيدها
        return ReviewPhonesModel.fromJson(jsonDecode(cachedData));
      } else {
        // إذا لم يوجد كاش أيضاً، نعيد رمي الخطأ
        rethrow;
      }
    }
  }
}