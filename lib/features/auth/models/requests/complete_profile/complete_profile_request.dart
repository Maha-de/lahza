import 'package:json_annotation/json_annotation.dart';

part 'complete_profile_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CompleteProfileRequest {
  final String? governorate;
  final String? area;
  final String? address;
  final double? latitude;
  final double? longitude;

  final String? phone;
  final String? phoneType;

  const CompleteProfileRequest({
    this.governorate,
    this.area,
    this.address,
    this.latitude,
    this.longitude,
    this.phone,
    this.phoneType,
  });

  factory CompleteProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteProfileRequestToJson(this);
}
