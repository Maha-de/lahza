import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/payment/models/responses/subscription_model.dart';
part 'subscription_response.g.dart';

@JsonSerializable()
class SubscriptionResponse {
  final bool success;
  final String message;
  final SubscriptionModel data;

  const SubscriptionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);
}