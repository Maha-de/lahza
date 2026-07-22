// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneFavoriteResponse _$BuyPhoneFavoriteResponseFromJson(
  Map<String, dynamic> json,
) => BuyPhoneFavoriteResponse(
  success: json['success'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => BuyPhoneFavoriteModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BuyPhoneFavoriteResponseToJson(
  BuyPhoneFavoriteResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
