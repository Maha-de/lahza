// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileData _$CompleteProfileDataFromJson(Map<String, dynamic> json) =>
    CompleteProfileData(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      governorate: json['governorate'] as String?,
      area: json['area'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CompleteProfileDataToJson(
  CompleteProfileData instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'governorate': instance.governorate,
  'area': instance.area,
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
