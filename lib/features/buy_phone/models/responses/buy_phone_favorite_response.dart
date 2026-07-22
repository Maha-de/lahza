import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_model.dart';

part 'buy_phone_favorite_response.g.dart';

@JsonSerializable()
class BuyPhoneFavoriteResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  List<BuyPhoneFavoriteModel>? data;

  BuyPhoneFavoriteResponse({this.success, this.data});

  factory BuyPhoneFavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneFavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneFavoriteResponseToJson(this);
}
