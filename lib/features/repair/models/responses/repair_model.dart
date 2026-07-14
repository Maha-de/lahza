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
  final String? scheduledAt;

  final String? diagnosisResult;
  final int? estimatedCost;
  final String? estimatedDuration;

  final String? repairLocation;
  final String? deliveryMethod;
  final String? pickupDate;
  final String? paymentMethod;

  final String? technicianId;
  final String? technician;

  final bool? isConfirmed;

  final String? cancellationReason;

  final String? representativeName;
  final String? representativePhone;
  final String? vehicleType;
  final String? vehicleNumber;

  final double? representativeLat;
  final double? representativeLng;

  final String? offerId;
  final String? couponCode;

  final int? originalPrice;
  final int? discountAmount;
  final int? totalPrice;

  final String? requestNumber;

  final String? createdAt;
  final String? updatedAt;

  const RepairModel({
    this.id,
    this.userId,
    this.type,
    this.status,
    this.issueType,
    this.otherIssue,
    this.otherIssueDescription,
    this.description,
    this.phoneType,
    this.phoneModel,
    this.attachments,
    this.address,
    this.scheduledAt,
    this.diagnosisResult,
    this.estimatedCost,
    this.estimatedDuration,
    this.repairLocation,
    this.deliveryMethod,
    this.pickupDate,
    this.paymentMethod,
    this.technicianId,
    this.technician,
    this.isConfirmed,
    this.cancellationReason,
    this.representativeName,
    this.representativePhone,
    this.vehicleType,
    this.vehicleNumber,
    this.representativeLat,
    this.representativeLng,
    this.offerId,
    this.couponCode,
    this.originalPrice,
    this.discountAmount,
    this.totalPrice,
    this.requestNumber,
    this.createdAt,
    this.updatedAt,
  });

factory RepairModel.fromJson(Map<String, dynamic> json) {
  print(json);
  return _$RepairModelFromJson(json);
}

  Map<String, dynamic> toJson() => _$RepairModelToJson(this);
}
