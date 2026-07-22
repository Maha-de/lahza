import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';

part 'buy_phone_details_response.g.dart';

@JsonSerializable()
class BuyPhoneDetailsResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  BuyPhoneModel? data;

  BuyPhoneDetailsResponse({this.success, this.data});

  factory BuyPhoneDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneDetailsResponseToJson(this);
}
