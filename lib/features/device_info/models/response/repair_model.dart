import 'package:json_annotation/json_annotation.dart';

part 'repair_model.g.dart';

@JsonSerializable()
class RepairModel {
  final String? id;
  final String? userId;
  final String? type;
  final String? status;
  final String? issueType;
  final String? otherIssue;
  final String? otherIssueDescription;
  final String? description;
  final String? phoneType;
  final String? phoneModel;
  final List<String>? attachments;
  final String? address;
  final DateTime? scheduledAt;
  final String? diagnosisResult;
  final num? estimatedCost;
  final String? estimatedDuration;
  final String? repairLocation;
  final String? deliveryMethod;
  final bool? isConfirmed;
  final num? totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RepairModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.issueType,
    this.otherIssue,
    this.otherIssueDescription,
    required this.description,
    required this.phoneType,
    required this.phoneModel,
    required this.attachments,
    this.address,
    this.scheduledAt,
    this.diagnosisResult,
    this.estimatedCost,
    this.estimatedDuration,
    this.repairLocation,
    this.deliveryMethod,
    required this.isConfirmed,
    this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RepairModel.fromJson(Map<String, dynamic> json) =>
      _$RepairModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepairModelToJson(this);
}