import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_otp_request.g.dart';

@JsonSerializable()
class VerifyResetOtpRequest {
  final String email;
  final String otp;

  VerifyResetOtpRequest({required this.email, required this.otp});

  factory VerifyResetOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyResetOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResetOtpRequestToJson(this);
}
