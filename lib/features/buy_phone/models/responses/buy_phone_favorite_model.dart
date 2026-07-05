import 'package:json_annotation/json_annotation.dart';

part 'buy_phone_favorite_model.g.dart';

@JsonSerializable()
class BuyPhoneFavoriteModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'condition')
  String? condition;

  @JsonKey(name: 'price')
  int? price;

  @JsonKey(name: 'storage')
  String? storage;

  BuyPhoneFavoriteModel({
    this.id,
    this.name,
    this.image,
    this.condition,
    this.price,
    this.storage,
  });

  factory BuyPhoneFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneFavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneFavoriteModelToJson(this);
}
