import 'package:json_annotation/json_annotation.dart';
part 'login_user.g.dart';

@JsonSerializable()
class LoginUser {
  final String id;
  final String fullName;
  final String email;
  final String role;
  final bool isProfileComplete;

  const LoginUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.isProfileComplete,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}