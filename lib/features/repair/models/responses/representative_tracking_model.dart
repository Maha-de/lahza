import 'package:json_annotation/json_annotation.dart';

part 'representative_tracking_model.g.dart';

@JsonSerializable()
class RepresentativeTrackingModel {
  final String? name;
  final String ?phone;

  final String ?vehicleType;
  final String ?vehicleNumber;

  final double? latitude;
  final double? longitude;

  const RepresentativeTrackingModel({
     this.name,
     this.phone,
     this.vehicleType,
     this.vehicleNumber,
    this.latitude,
    this.longitude,
  });

  factory RepresentativeTrackingModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$RepresentativeTrackingModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RepresentativeTrackingModelToJson(this);
}