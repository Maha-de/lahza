import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/device_info/models/response/repair_model.dart';

part 'repair_response.g.dart';

@JsonSerializable()
class RepairResponse {
  final bool success;
  final String message;
  final RepairModel data;

  const RepairResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RepairResponse.fromJson(Map<String, dynamic> json) =>
      _$RepairResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RepairResponseToJson(this);
}
