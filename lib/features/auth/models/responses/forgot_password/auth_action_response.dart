import 'package:json_annotation/json_annotation.dart';

part 'auth_action_response.g.dart';

@JsonSerializable()
class AuthActionResponse {
  final bool success;
  final String message;

  AuthActionResponse({required this.success, required this.message});

  factory AuthActionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthActionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthActionResponseToJson(this);
}
