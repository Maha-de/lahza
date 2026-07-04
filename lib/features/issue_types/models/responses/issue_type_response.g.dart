// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueTypeResponse _$IssueTypeResponseFromJson(Map<String, dynamic> json) =>
    IssueTypeResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IssueTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueTypeResponseToJson(IssueTypeResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
