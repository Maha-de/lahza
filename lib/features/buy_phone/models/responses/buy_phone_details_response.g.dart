// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneDetailsResponse _$BuyPhoneDetailsResponseFromJson(
  Map<String, dynamic> json,
) => BuyPhoneDetailsResponse(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : BuyPhoneModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BuyPhoneDetailsResponseToJson(
  BuyPhoneDetailsResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
