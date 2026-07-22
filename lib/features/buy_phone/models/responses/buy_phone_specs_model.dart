import 'package:json_annotation/json_annotation.dart';

part 'buy_phone_specs_model.g.dart';

@JsonSerializable()
class BuyPhoneSpecsModel {
  @JsonKey(name: 'os')
  String? os;

  @JsonKey(name: 'cpu')
  String? cpu;

  @JsonKey(name: 'ram')
  String? ram;

  @JsonKey(name: 'screen')
  String? screen;

  @JsonKey(name: 'battery')
  String? battery;

  @JsonKey(name: 'storage')
  String? storage;

  @JsonKey(name: 'rearCamera')
  String? rearCamera;

  @JsonKey(name: 'frontCamera')
  String? frontCamera;

  BuyPhoneSpecsModel({
    this.os,
    this.cpu,
    this.ram,
    this.screen,
    this.battery,
    this.storage,
    this.rearCamera,
    this.frontCamera,
  });

  factory BuyPhoneSpecsModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneSpecsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneSpecsModelToJson(this);
}
