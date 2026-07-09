import 'package:json_annotation/json_annotation.dart';
part 'products_specs_model.g.dart';

@JsonSerializable()

class ProductsSpecsModel {
  bool success;
  Data data;

  ProductsSpecsModel({
    required this.success,
    required this.data,
  });

  factory ProductsSpecsModel.fromJson(Map<String, dynamic> json) => ProductsSpecsModel(
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
  String name;
  String brand;
  String description;
  String condition;
  List<String> images;
  double rating;
  Specs specs;
  List<String> features;
  List<String> defects;
  List<String> boxContent;
  DateTime createdAt;
  DateTime updatedAt;
  List<Variant> variants;

  Data({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.condition,
    required this.images,
    required this.rating,
    required this.specs,
    required this.features,
    required this.defects,
    required this.boxContent,
    required this.createdAt,
    required this.updatedAt,
    required this.variants,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    description: json["description"],
    condition: json["condition"],
    images: List<String>.from(json["images"].map((x) => x)),
    rating: json["rating"]?.toDouble(),
    specs: Specs.fromJson(json["specs"]),
    features: List<String>.from(json["features"].map((x) => x)),
    defects: List<String>.from(json["defects"].map((x) => x)),
    boxContent: List<String>.from(json["boxContent"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "description": description,
    "condition": condition,
    "images": List<dynamic>.from(images.map((x) => x)),
    "rating": rating,
    "specs": specs.toJson(),
    "features": List<dynamic>.from(features.map((x) => x)),
    "defects": List<dynamic>.from(defects.map((x) => x)),
    "boxContent": List<dynamic>.from(boxContent.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class Specs {
  String os;
  String cpu;
  String ram;
  String screen;
  String battery;
  String storage;
  String rearCamera;
  String frontCamera;

  Specs({
    required this.os,
    required this.cpu,
    required this.ram,
    required this.screen,
    required this.battery,
    required this.storage,
    required this.rearCamera,
    required this.frontCamera,
  });

  factory Specs.fromJson(Map<String, dynamic> json) => Specs(
    os: json["os"],
    cpu: json["cpu"],
    ram: json["ram"],
    screen: json["screen"],
    battery: json["battery"],
    storage: json["storage"],
    rearCamera: json["rearCamera"],
    frontCamera: json["frontCamera"],
  );

  Map<String, dynamic> toJson() => {
    "os": os,
    "cpu": cpu,
    "ram": ram,
    "screen": screen,
    "battery": battery,
    "storage": storage,
    "rearCamera": rearCamera,
    "frontCamera": frontCamera,
  };
}

class Variant {
  String id;
  String productId;
  String color;
  String storage;
  int price;
  int quantity;
  DateTime createdAt;

  Variant({
    required this.id,
    required this.productId,
    required this.color,
    required this.storage,
    required this.price,
    required this.quantity,
    required this.createdAt,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    productId: json["productId"],
    color: json["color"],
    storage: json["storage"],
    price: json["price"],
    quantity: json["quantity"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productId": productId,
    "color": color,
    "storage": storage,
    "price": price,
    "quantity": quantity,
    "createdAt": createdAt.toIso8601String(),
  };
}
