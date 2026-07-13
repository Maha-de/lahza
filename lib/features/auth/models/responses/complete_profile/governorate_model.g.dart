// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'governorate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GovernorateModel _$GovernorateModelFromJson(Map<String, dynamic> json) =>
    GovernorateModel(
      id: (json['id'] as num).toInt(),
      governorateNameAr: json['nameAr'] as String,
      governorateNameEn: json['nameEn'] as String,
    );

Map<String, dynamic> _$GovernorateModelToJson(GovernorateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameAr': instance.governorateNameAr,
      'nameEn': instance.governorateNameEn,
    };
