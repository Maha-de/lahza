// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersModel _$OffersModelFromJson(Map<String, dynamic> json) => OffersModel(
  success: json['success'] as bool,
  data: (json['data'] as List<dynamic>)
      .map((e) => Data.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OffersModelToJson(OffersModel instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
