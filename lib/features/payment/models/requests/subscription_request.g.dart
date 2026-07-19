// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionRequest _$SubscriptionRequestFromJson(Map<String, dynamic> json) =>
    SubscriptionRequest(
      paymentMethod: json['paymentMethod'] as String,
      transferNumber: json['transferNumber'] as String?,
    );

Map<String, dynamic> _$SubscriptionRequestToJson(
  SubscriptionRequest instance,
) => <String, dynamic>{
  'paymentMethod': instance.paymentMethod,
  'transferNumber': ?instance.transferNumber,
};
