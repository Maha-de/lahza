import 'package:json_annotation/json_annotation.dart';
import 'complete_profile_data.dart';

part 'complete_profile_response.g.dart';

@JsonSerializable()
class CompleteProfileResponse {
  final bool? success;
  final String? message;
  final CompleteProfileData? data;

  const CompleteProfileResponse({this.success, this.message, this.data});

  factory CompleteProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteProfileResponseToJson(this);
}
