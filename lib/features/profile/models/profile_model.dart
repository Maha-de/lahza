import 'package:json_annotation/json_annotation.dart';
part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  bool success;
  Data data;
  String? message;

  ProfileModel({required this.success, required this.data, this.message});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json['message'],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String? id;
  String? fullName;
  String? phone;
  String? phoneType;
  dynamic avatar;
  String? role;
  bool? isProfileComplete;
  dynamic profile;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? password;
  dynamic email;
  bool? isActive;
  dynamic socialProvider;
  dynamic socialId;
  dynamic otp;
  dynamic otpExpiresAt;

  Data({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.phoneType,
    required this.avatar,
    required this.role,
    required this.isProfileComplete,
    required this.profile,
    required this.createdAt,
    this.updatedAt,
    this.password,
    this.email,
    this.isActive,
    this.socialProvider,
    this.socialId,
    this.otp,
    this.otpExpiresAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    fullName: json["fullName"],
    phone: json["phone"],
    phoneType: json["phoneType"],
    avatar: json["avatar"],
    role: json["role"],
    isProfileComplete: json["isProfileComplete"],
    profile: json["profile"],
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json["createdAt"] as String),
    email: json["email"],
    password: json["password"],
    isActive: json["isActive"],
    socialProvider: json["socialProvider"],
    socialId: json["socialId"],
    otp: json["otp"],
    otpExpiresAt: json["otpExpiresAt"],
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "phone": phone,
    "phoneType": phoneType,
    "avatar": avatar,
    "role": role,
    "isProfileComplete": isProfileComplete,
    "profile": profile,
    "createdAt": createdAt?.toIso8601String(),
    "email": email,
    "password": password,
    "isActive": isActive,
    "socialProvider": socialProvider,
    "socialId": socialId,
    "otp": otp,
    "otpExpiresAt": otpExpiresAt,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
