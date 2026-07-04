// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_phone_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewPhoneDetailsModel _$ReviewPhoneDetailsModelFromJson(
  Map<String, dynamic> json,
) => ReviewPhoneDetailsModel(
  success: json['success'] as bool,
  data: Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReviewPhoneDetailsModelToJson(
  ReviewPhoneDetailsModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
