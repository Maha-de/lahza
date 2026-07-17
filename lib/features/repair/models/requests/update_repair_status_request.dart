import 'package:json_annotation/json_annotation.dart';

part 'update_repair_status_request.g.dart';

@JsonSerializable()
class UpdateRepairStatusRequest {
  final String status;
  final String? reason;

  const UpdateRepairStatusRequest({
    required this.status,
    this.reason,
  });

  factory UpdateRepairStatusRequest.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$UpdateRepairStatusRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateRepairStatusRequestToJson(this);
}