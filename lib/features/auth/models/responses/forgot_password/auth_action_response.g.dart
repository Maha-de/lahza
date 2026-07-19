// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_action_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthActionResponse _$AuthActionResponseFromJson(Map<String, dynamic> json) =>
    AuthActionResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$AuthActionResponseToJson(AuthActionResponse instance) =>
    <String, dynamic>{'success': instance.success, 'message': instance.message};
