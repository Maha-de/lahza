// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairRequest _$RepairRequestFromJson(Map<String, dynamic> json) =>
    RepairRequest(
      issueType: json['issueType'] as String,
      description: json['description'] as String,
      phoneType: json['phoneType'] as String,
      phoneModel: json['phoneModel'] as String,
      otherIssue: json['otherIssue'] as String?,
      otherIssueDescription: json['otherIssueDescription'] as String?,
    );

Map<String, dynamic> _$RepairRequestToJson(RepairRequest instance) =>
    <String, dynamic>{
      'issueType': instance.issueType,
      'description': instance.description,
      'phoneType': instance.phoneType,
      'phoneModel': instance.phoneModel,
      'otherIssue': ?instance.otherIssue,
      'otherIssueDescription': ?instance.otherIssueDescription,
    };
