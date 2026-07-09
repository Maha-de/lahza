import 'package:json_annotation/json_annotation.dart';
import 'register_data.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  final bool success;
  final String message;
  final RegisterData data;

  const RegisterResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}