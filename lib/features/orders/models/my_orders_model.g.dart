// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrdersModel _$MyOrdersModelFromJson(Map<String, dynamic> json) =>
    MyOrdersModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersModelToJson(MyOrdersModel instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
