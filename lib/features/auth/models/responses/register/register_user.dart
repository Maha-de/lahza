import 'package:json_annotation/json_annotation.dart';
part 'register_user.g.dart';

@JsonSerializable()
class RegisterUser {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String role;

  const RegisterUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.role,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
}