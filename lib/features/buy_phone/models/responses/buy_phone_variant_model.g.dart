// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneVariantModel _$BuyPhoneVariantModelFromJson(
  Map<String, dynamic> json,
) => BuyPhoneVariantModel(
  id: json['id'] as String?,
  productId: json['productId'] as String?,
  color: json['color'] as String?,
  storage: json['storage'] as String?,
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$BuyPhoneVariantModelToJson(
  BuyPhoneVariantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'color': instance.color,
  'storage': instance.storage,
  'price': instance.price,
  'quantity': instance.quantity,
  'createdAt': instance.createdAt,
};
