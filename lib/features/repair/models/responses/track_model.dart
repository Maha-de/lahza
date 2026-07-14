import 'package:json_annotation/json_annotation.dart';

import 'representative_tracking_model.dart';
import 'technician_tracking_model.dart';
import 'timeline_model.dart';
import 'user_tracking_model.dart';

part 'track_model.g.dart';

@JsonSerializable()
class TrackModel {
  final String? id;
  final String? requestNumber;
  final String? status;
  final String? repairLocation;

  final String? phoneType;
  final String? phoneModel;

  final String? diagnosisResult;

  final int? estimatedCost;
  final String? estimatedDuration;
  final int? totalPrice;

  final dynamic offer;

  final String? pickupDate;

  final String? createdAt;

  final String? representativeName;
  final String? representativePhone;
  final String? vehicleType;
  final String? vehicleNumber;

  final double? representativeLat;
  final double? representativeLng;

  final UserTrackingModel? user;

  final List<TimelineModel>? timeline;

  final RepresentativeTrackingModel? representativeTracking;

  final TechnicianTrackingModel? technicianTracking;

  const TrackModel({
    this.id,
    this.requestNumber,
    this.status,
    this.repairLocation,
    this.phoneType,
    this.phoneModel,
    this.diagnosisResult,
    this.estimatedCost,
    this.estimatedDuration,
    this.totalPrice,
    this.offer,
    this.pickupDate,
    this.createdAt,
    this.representativeName,
    this.representativePhone,
    this.vehicleType,
    this.vehicleNumber,
    this.representativeLat,
    this.representativeLng,
    this.user,
    this.timeline,
    this.representativeTracking,
    this.technicianTracking,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) =>
      _$TrackModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackModelToJson(this);
}
