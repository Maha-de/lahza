import 'package:json_annotation/json_annotation.dart';

part 'google_auth_model.g.dart';

@JsonSerializable()
class GoogleAuthModel {
  final String idToken;
  final String? accessToken;
  final String email;
  final String name;
  final String? image;

  const GoogleAuthModel({
    required this.idToken,
    this.accessToken,
    required this.email,
    required this.name,
    this.image,
  });

  factory GoogleAuthModel.fromJson(Map<String, dynamic> json) =>
      _$GoogleAuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleAuthModelToJson(this);
}