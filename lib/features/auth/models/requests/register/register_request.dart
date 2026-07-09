import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String fullName;
  final String phone;
  final String email;
  final String password;
  final String phoneType;

  const RegisterRequest({
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.phoneType,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}