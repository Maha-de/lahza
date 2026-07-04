
import 'package:json_annotation/json_annotation.dart';
part 'review_phones_model.g.dart';

@JsonSerializable()
class ReviewPhonesModel {
  final bool success;
  final int count;
  final List<Data> data;

  ReviewPhonesModel({required this.success, required this.count, required this.data});

  factory ReviewPhonesModel.fromJson(Map<String, dynamic> json) => _$ReviewPhonesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewPhonesModelToJson(this);
}

@JsonSerializable()
class Data {
  final String productId;
  final String reviewId;
  final String name;
  final String brand;
  final String description;
  final String image;
  final double rating;

  Data({
    required this.productId,
    required this.reviewId,
    required this.name,
    required this.brand,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}