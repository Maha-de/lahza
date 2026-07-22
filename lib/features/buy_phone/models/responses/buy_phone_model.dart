import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_specs_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_variant_model.dart';

part 'buy_phone_model.g.dart';

@JsonSerializable()
class BuyPhoneModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'brand')
  String? brand;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'condition')
  String? condition;

  @JsonKey(name: 'images')
  List<String>? images;

  @JsonKey(name: 'rating')
  double? rating;

  @JsonKey(name: 'specs')
  BuyPhoneSpecsModel? specs;

  @JsonKey(name: 'features')
  List<String>? features;

  @JsonKey(name: 'defects')
  List<String>? defects;

  @JsonKey(name: 'boxContent')
  List<String>? boxContent;

  @JsonKey(name: 'variants')
  List<BuyPhoneVariantModel>? variants;

  @JsonKey(name: 'stock')
  int? stock;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  @JsonKey(name: 'isFavorite', defaultValue: false)
bool isFavorite;

  BuyPhoneModel({
    this.id,
    this.name,
    this.brand,
    this.description,
    this.condition,
    this.images,
    this.rating,
    this.specs,
    this.features,
    this.defects,
    this.boxContent,
    this.variants,
    this.stock,
    this.createdAt,
    this.updatedAt,
    this.isFavorite = false,
  });

  factory BuyPhoneModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneModelToJson(this);
}
