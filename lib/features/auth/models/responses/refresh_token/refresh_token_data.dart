import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_data.g.dart';

@JsonSerializable()
class RefreshTokenData {
  final String accessToken;
  final String refreshToken;

  const RefreshTokenData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenDataToJson(this);
}
