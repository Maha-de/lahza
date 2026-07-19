// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      paymentMethod: json['paymentMethod'] as String,
      transferNumber: json['transferNumber'] as String?,
      receiptUrl: json['receiptUrl'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'paymentMethod': instance.paymentMethod,
      'transferNumber': instance.transferNumber,
      'receiptUrl': instance.receiptUrl,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
