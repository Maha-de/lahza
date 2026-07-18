import 'package:json_annotation/json_annotation.dart';
part 'subscription_request.g.dart';

@JsonSerializable(includeIfNull: false)
class SubscriptionRequest {
  final String paymentMethod;
  final String? transferNumber;

  const SubscriptionRequest({
    required this.paymentMethod,
    this.transferNumber,
  });

  factory SubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionRequestToJson(this);
}