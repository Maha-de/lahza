// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairModel _$RepairModelFromJson(Map<String, dynamic> json) => RepairModel(
  id: json['id'] as String?,
  userId: json['userId'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  issueType: json['issueType'] as String?,
  otherIssue: json['otherIssue'] as String?,
  otherIssueDescription: json['otherIssueDescription'] as String?,
  description: json['description'] as String?,
  phoneType: json['phoneType'] as String?,
  phoneModel: json['phoneModel'] as String?,
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  address: json['address'] as String?,
  scheduledAt: json['scheduledAt'] == null
      ? null
      : DateTime.parse(json['scheduledAt'] as String),
  diagnosisResult: json['diagnosisResult'] as String?,
  estimatedCost: json['estimatedCost'] as num?,
  estimatedDuration: json['estimatedDuration'] as String?,
  repairLocation: json['repairLocation'] as String?,
  deliveryMethod: json['deliveryMethod'] as String?,
  isConfirmed: json['isConfirmed'] as bool?,
  totalPrice: json['totalPrice'] as num?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$RepairModelToJson(RepairModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'status': instance.status,
      'issueType': instance.issueType,
      'otherIssue': instance.otherIssue,
      'otherIssueDescription': instance.otherIssueDescription,
      'description': instance.description,
      'phoneType': instance.phoneType,
      'phoneModel': instance.phoneModel,
      'attachments': instance.attachments,
      'address': instance.address,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'diagnosisResult': instance.diagnosisResult,
      'estimatedCost': instance.estimatedCost,
      'estimatedDuration': instance.estimatedDuration,
      'repairLocation': instance.repairLocation,
      'deliveryMethod': instance.deliveryMethod,
      'isConfirmed': instance.isConfirmed,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
