import 'package:flutter/material.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';

@immutable
sealed class ReviewsState {}

// 1. الحالة الأولية (قبل أن يبدأ أي طلب)
final class ReviewsInitial extends ReviewsState {}

// 2. حالة التحميل (عندما نكون في انتظار السيرفر)
final class ReviewsLoading extends ReviewsState {}

// 3. حالة النجاح (تحتوي على البيانات التي ستعرض في الـ UI)
final class ReviewsSuccess extends ReviewsState {
  final List<Data> data; // هنا نمرر الـ List التي يحتاجها الـ UI
  ReviewsSuccess({required this.data});
}

// 4. حالة الخطأ (تحتوي على رسالة الخطأ)
final class ReviewsError extends ReviewsState {
  final String message;
  ReviewsError({required this.message});
}
