import 'package:json_annotation/json_annotation.dart';

part 'user_tracking_model.g.dart';

@JsonSerializable()
class UserTrackingModel {
  final String? fullName;
  final String? phone;

  const UserTrackingModel({this.fullName, this.phone});

  factory UserTrackingModel.fromJson(Map<String, dynamic> json) =>
      _$UserTrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserTrackingModelToJson(this);
}
