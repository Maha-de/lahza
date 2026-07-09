// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleAuthModel _$GoogleAuthModelFromJson(Map<String, dynamic> json) =>
    GoogleAuthModel(
      idToken: json['idToken'] as String,
      accessToken: json['accessToken'] as String?,
      email: json['email'] as String,
      name: json['name'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GoogleAuthModelToJson(GoogleAuthModel instance) =>
    <String, dynamic>{
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
    };
