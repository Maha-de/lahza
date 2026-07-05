// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_specs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsSpecsModel _$ProductsSpecsModelFromJson(Map<String, dynamic> json) =>
    ProductsSpecsModel(
      success: json['success'] as bool,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsSpecsModelToJson(ProductsSpecsModel instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
