import 'package:json_annotation/json_annotation.dart';
import 'register_user.dart';
part 'register_data.g.dart';

@JsonSerializable()
class RegisterData {
  final RegisterUser user;

  final String token;

  const RegisterData({
    required this.user,
    required this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterDataToJson(this);
}