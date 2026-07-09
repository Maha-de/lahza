// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairResponse _$RepairResponseFromJson(Map<String, dynamic> json) =>
    RepairResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: RepairModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RepairResponseToJson(RepairResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
