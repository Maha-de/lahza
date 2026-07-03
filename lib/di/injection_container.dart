

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lahza/api_consumer.dart';
import 'package:lahza/dio_consumer.dart';
import 'package:lahza/features/reviews/cubit/reviews_cubit.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. الأساسيات (External): أولاً الـ Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // 2. الطبقة الوسطى (Core): الـ ApiConsumer (يعتمد على Dio)
  // تأكد أنك تستخدم Interface (ApiConsumer) وليس التنفيذ (DioConsumer) إذا كنت تستخدم تعدد الأشكال
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: sl<Dio>()));

  // 3. الـ Repository (يعتمد على ApiConsumer)
  sl.registerLazySingleton(() => ReviewsRepository(api: sl<ApiConsumer>()));

  // 4. الـ Cubit (يعتمد على Repository)
  sl.registerFactory(() => PhoneReviewsCubit(repository: sl<ReviewsRepository>()));
}