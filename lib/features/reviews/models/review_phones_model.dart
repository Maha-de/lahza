import 'dart:convert';

ReviewPhonesModel reviewPhonesModelFromJson(String str) => ReviewPhonesModel.fromJson(json.decode(str));

String reviewPhonesModelToJson(ReviewPhonesModel data) => json.encode(data.toJson());

class ReviewPhonesModel {
  bool success;
  int count;
  List<Data> data;

  ReviewPhonesModel({
    required this.success,
    required this.count,
    required this.data,
  });

  factory ReviewPhonesModel.fromJson(Map<String, dynamic> json) => ReviewPhonesModel(
    success: json["success"],
    count: json["count"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  String productId;
  String reviewId;
  String name;
  String brand;
  String description;
  String image;
  double rating;

  Data({
    required this.productId,
    required this.reviewId,
    required this.name,
    required this.brand,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    productId: json["productId"],
    reviewId: json["reviewId"],
    name: json["name"],
    brand: json["brand"],
    description: json["description"],
    image: json["image"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "reviewId": reviewId,
    "name": name,
    "brand": brand,
    "description": description,
    "image": image,
    "rating": rating,
  };
}