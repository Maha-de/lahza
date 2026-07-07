import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/auth/models/responses/login/login_user.dart';
part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  final LoginUser user;
  final String token;

  const LoginData({
    required this.user,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}