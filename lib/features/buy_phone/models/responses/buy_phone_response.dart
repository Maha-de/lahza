import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';

part 'buy_phone_response.g.dart';

@JsonSerializable()
class BuyPhoneResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  List<BuyPhoneModel>? data;

  BuyPhoneResponse({this.success, this.data});

  factory BuyPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneResponseToJson(this);
}
