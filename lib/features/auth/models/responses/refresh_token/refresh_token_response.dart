import 'package:json_annotation/json_annotation.dart';
import 'refresh_token_data.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse {
  final bool success;
  final String message;
  final RefreshTokenData data;

  const RefreshTokenResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
