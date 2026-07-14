// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrdersModel _$MyOrdersModelFromJson(Map<String, dynamic> json) =>
    MyOrdersModel(
      id: json['id'] as String?,
      requestNumber: json['requestNumber'] as String?,
      phoneType: json['phoneType'] as String?,
      phoneModel: json['phoneModel'] as String?,
      issueType: json['issueType'] as String?,
      diagnosisResult: json['diagnosisResult'] as String?,
      status: json['status'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$MyOrdersModelToJson(MyOrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requestNumber': instance.requestNumber,
      'phoneType': instance.phoneType,
      'phoneModel': instance.phoneModel,
      'issueType': instance.issueType,
      'diagnosisResult': instance.diagnosisResult,
      'status': instance.status,
      'attachments': instance.attachments,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
