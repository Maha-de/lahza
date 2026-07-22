// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneModel _$BuyPhoneModelFromJson(Map<String, dynamic> json) =>
    BuyPhoneModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      description: json['description'] as String?,
      condition: json['condition'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rating: (json['rating'] as num?)?.toDouble(),
      specs: json['specs'] == null
          ? null
          : BuyPhoneSpecsModel.fromJson(json['specs'] as Map<String, dynamic>),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defects: (json['defects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      boxContent: (json['boxContent'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => BuyPhoneVariantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      stock: (json['stock'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$BuyPhoneModelToJson(BuyPhoneModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'description': instance.description,
      'condition': instance.condition,
      'images': instance.images,
      'rating': instance.rating,
      'specs': instance.specs,
      'features': instance.features,
      'defects': instance.defects,
      'boxContent': instance.boxContent,
      'variants': instance.variants,
      'stock': instance.stock,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isFavorite': instance.isFavorite,
    };
