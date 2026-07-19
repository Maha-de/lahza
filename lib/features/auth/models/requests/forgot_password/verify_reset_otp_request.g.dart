// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_reset_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyResetOtpRequest _$VerifyResetOtpRequestFromJson(
  Map<String, dynamic> json,
) => VerifyResetOtpRequest(
  email: json['email'] as String,
  otp: json['otp'] as String,
);

Map<String, dynamic> _$VerifyResetOtpRequestToJson(
  VerifyResetOtpRequest instance,
) => <String, dynamic>{'email': instance.email, 'otp': instance.otp};
