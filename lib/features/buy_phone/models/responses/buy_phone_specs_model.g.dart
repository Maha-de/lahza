// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_phone_specs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyPhoneSpecsModel _$BuyPhoneSpecsModelFromJson(Map<String, dynamic> json) =>
    BuyPhoneSpecsModel(
      os: json['os'] as String?,
      cpu: json['cpu'] as String?,
      ram: json['ram'] as String?,
      screen: json['screen'] as String?,
      battery: json['battery'] as String?,
      storage: json['storage'] as String?,
      rearCamera: json['rearCamera'] as String?,
      frontCamera: json['frontCamera'] as String?,
    );

Map<String, dynamic> _$BuyPhoneSpecsModelToJson(BuyPhoneSpecsModel instance) =>
    <String, dynamic>{
      'os': instance.os,
      'cpu': instance.cpu,
      'ram': instance.ram,
      'screen': instance.screen,
      'battery': instance.battery,
      'storage': instance.storage,
      'rearCamera': instance.rearCamera,
      'frontCamera': instance.frontCamera,
    };
