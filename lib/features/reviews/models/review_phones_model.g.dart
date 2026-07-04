// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_phones_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPhonesModel _$ReviewPhonesModelFromJson(Map<String, dynamic> json) =>
    ReviewPhonesModel(
      success: json['success'] as bool,
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewPhonesModelToJson(ReviewPhonesModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  productId: json['productId'] as String,
  reviewId: json['reviewId'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'productId': instance.productId,
  'reviewId': instance.reviewId,
  'name': instance.name,
  'brand': instance.brand,
  'description': instance.description,
  'image': instance.image,
  'rating': instance.rating,
};
