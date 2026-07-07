import 'package:json_annotation/json_annotation.dart';
part 'offers_model.g.dart';

@JsonSerializable()
class OffersModel {
  bool success;
  List<Data> data;

  OffersModel({
    required this.success,
    required this.data,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
    success: json["success"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  String id;
  String title;
  String description;
  String image;
  String discountType;
  int discountValue;
  String serviceType;
  dynamic couponCode;
  DateTime startDate;
  DateTime endDate;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.discountType,
    required this.discountValue,
    required this.serviceType,
    required this.couponCode,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    discountType: json["discountType"],
    discountValue: json["discountValue"],
    serviceType: json["serviceType"],
    couponCode: json["couponCode"],
    startDate: DateTime.parse(json["startDate"]),
    endDate: DateTime.parse(json["endDate"]),
    isActive: json["isActive"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "discountType": discountType,
    "discountValue": discountValue,
    "serviceType": serviceType,
    "couponCode": couponCode,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    "isActive": isActive,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
