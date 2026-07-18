import 'package:json_annotation/json_annotation.dart';
part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  final String id;
  final String userId;
  final String paymentMethod;
  final String? transferNumber;
  final String receiptUrl;
  final String status;
  final DateTime createdAt;

  const SubscriptionModel({
    required this.id,
    required this.userId,
    required this.paymentMethod,
    this.transferNumber,
    required this.receiptUrl,
    required this.status,
    required this.createdAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionModelToJson(this);
}