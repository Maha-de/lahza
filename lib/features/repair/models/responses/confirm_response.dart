import 'package:json_annotation/json_annotation.dart';
import 'repair_model.dart';

part 'confirm_response.g.dart';

@JsonSerializable()
class ConfirmResponse {
  final bool? success;
  final String? message;
  final RepairModel? data;

  const ConfirmResponse({this.success, this.message, this.data});

  factory ConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmResponseToJson(this);
}
