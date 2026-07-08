import 'package:json_annotation/json_annotation.dart';

part 'complete_profile_data.g.dart';

@JsonSerializable()
class CompleteProfileData {
  final String? id;
  final String? userId;
  final String? governorate;
  final String? area;
  final String? address;
  final double? latitude;
  final double? longitude;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CompleteProfileData({
    this.id,
    this.userId,
    this.governorate,
    this.area,
    this.address,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  factory CompleteProfileData.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteProfileDataToJson(this);
}
