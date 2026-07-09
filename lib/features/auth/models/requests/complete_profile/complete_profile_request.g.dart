// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileRequest _$CompleteProfileRequestFromJson(
  Map<String, dynamic> json,
) => CompleteProfileRequest(
  governorate: json['governorate'] as String?,
  area: json['area'] as String?,
  address: json['address'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  phone: json['phone'] as String?,
  phoneType: json['phoneType'] as String?,
);

Map<String, dynamic> _$CompleteProfileRequestToJson(
  CompleteProfileRequest instance,
) => <String, dynamic>{
  'governorate': ?instance.governorate,
  'area': ?instance.area,
  'address': ?instance.address,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'phone': ?instance.phone,
  'phoneType': ?instance.phoneType,
};
