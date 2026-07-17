import 'package:json_annotation/json_annotation.dart';
import 'repair_model.dart';

part 'repair_response.g.dart';

@JsonSerializable()
class RepairResponse {
  final bool? success;
  final String? message;
  final RepairModel? data;

  const RepairResponse({this.success, this.message, this.data});

factory RepairResponse.fromJson(Map<String, dynamic> json) {
  return RepairResponse(
    success: json['success'] as bool?,
    message: json['message'] as String?,
    data: RepairModel.fromJson(json['data'] as Map<String, dynamic>),
  );
}

  Map<String, dynamic> toJson() => _$RepairResponseToJson(this);
}
