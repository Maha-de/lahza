import 'package:json_annotation/json_annotation.dart';

part 'buy_phone_variant_model.g.dart';

@JsonSerializable()
class BuyPhoneVariantModel {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'productId')
  String? productId;

  @JsonKey(name: 'color')
  String? color;

  @JsonKey(name: 'storage')
  String? storage;

  @JsonKey(name: 'price')
  int? price;

  @JsonKey(name: 'quantity')
  int? quantity;

  @JsonKey(name: 'createdAt')
  String? createdAt;

  BuyPhoneVariantModel({
    this.id,
    this.productId,
    this.color,
    this.storage,
    this.price,
    this.quantity,
    this.createdAt,
  });

  factory BuyPhoneVariantModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneVariantModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneVariantModelToJson(this);
}
