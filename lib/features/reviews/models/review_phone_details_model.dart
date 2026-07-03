import 'dart:convert';

ReviewPhoneDetailsModel reviewPhoneDetailsModelFromJson(String str) => ReviewPhoneDetailsModel.fromJson(json.decode(str));

String reviewPhoneDetailsModelToJson(ReviewPhoneDetailsModel data) => json.encode(data.toJson());

class ReviewPhoneDetailsModel {
  bool success;
  Data data;

  ReviewPhoneDetailsModel({
    required this.success,
    required this.data,
  });

  factory ReviewPhoneDetailsModel.fromJson(Map<String, dynamic> json) => ReviewPhoneDetailsModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  String id;
  String productId;
  double overallRate;
  int performance;
  double camera;
  double battery;
  double display;
  double valueForMoney;
  List<String> pros;
  List<String> cons;
  String summary;
  String recommendation;
  DateTime createdAt;
  DateTime updatedAt;
  Product product;

  Data({
    required this.id,
    required this.productId,
    required this.overallRate,
    required this.performance,
    required this.camera,
    required this.battery,
    required this.display,
    required this.valueForMoney,
    required this.pros,
    required this.cons,
    required this.summary,
    required this.recommendation,
    required this.createdAt,
    required this.updatedAt,
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    productId: json["productId"],
    overallRate: json["overallRate"]?.toDouble(),
    performance: json["performance"],
    camera: json["camera"]?.toDouble(),
    battery: json["battery"]?.toDouble(),
    display: json["display"]?.toDouble(),
    valueForMoney: json["valueForMoney"]?.toDouble(),
    pros: List<String>.from(json["pros"].map((x) => x)),
    cons: List<String>.from(json["cons"].map((x) => x)),
    summary: json["summary"],
    recommendation: json["recommendation"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "overallRate": overallRate,
    "performance": performance,
    "camera": camera,
    "battery": battery,
    "display": display,
    "valueForMoney": valueForMoney,
    "pros": List<dynamic>.from(pros.map((x) => x)),
    "cons": List<dynamic>.from(cons.map((x) => x)),
    "summary": summary,
    "recommendation": recommendation,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "product": product.toJson(),
  };
}

class Product {
  String id;
  String name;
  String brand;
  List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}