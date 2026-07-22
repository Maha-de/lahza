// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneFavoriteModel _$BuyPhoneFavoriteModelFromJson(
  Map<String, dynamic> json,
) => BuyPhoneFavoriteModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  image: json['image'] as String?,
  condition: json['condition'] as String?,
  price: (json['price'] as num?)?.toInt(),
  storage: json['storage'] as String?,
);

Map<String, dynamic> _$BuyPhoneFavoriteModelToJson(
  BuyPhoneFavoriteModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'condition': instance.condition,
  'price': instance.price,
  'storage': instance.storage,
};
