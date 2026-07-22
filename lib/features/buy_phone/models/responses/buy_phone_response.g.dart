// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneResponse _$BuyPhoneResponseFromJson(Map<String, dynamic> json) =>
    BuyPhoneResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BuyPhoneModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuyPhoneResponseToJson(BuyPhoneResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
