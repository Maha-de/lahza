import 'package:json_annotation/json_annotation.dart';

part 'buy_phone_favorite_status_response.g.dart';

@JsonSerializable()
class BuyPhoneFavoriteStatusResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'status')
  String? status;

  BuyPhoneFavoriteStatusResponse({this.success, this.status});

  factory BuyPhoneFavoriteStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$BuyPhoneFavoriteStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BuyPhoneFavoriteStatusResponseToJson(this);
}
