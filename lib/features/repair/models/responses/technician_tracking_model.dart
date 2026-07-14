import 'package:json_annotation/json_annotation.dart';

part 'technician_tracking_model.g.dart';

@JsonSerializable()
class TechnicianTrackingModel {
  final String? name;
  final String? phone;

  final double? latitude;
  final double? longitude;

  const TechnicianTrackingModel({
    this.name,
    this.phone,
    this.latitude,
    this.longitude,
  });

  factory TechnicianTrackingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$TechnicianTrackingModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TechnicianTrackingModelToJson(this);
}