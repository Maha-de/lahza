import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/repair/models/responses/repair_model.dart';

part 'update_repair_status_response.g.dart';

@JsonSerializable()
class UpdateRepairStatusResponse {
  final bool success;
  final String message;
  final RepairModel data;

  const UpdateRepairStatusResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory UpdateRepairStatusResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$UpdateRepairStatusResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateRepairStatusResponseToJson(this);
}