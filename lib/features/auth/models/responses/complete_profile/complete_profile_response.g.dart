// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileResponse _$CompleteProfileResponseFromJson(
  Map<String, dynamic> json,
) => CompleteProfileResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : CompleteProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CompleteProfileResponseToJson(
  CompleteProfileResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
