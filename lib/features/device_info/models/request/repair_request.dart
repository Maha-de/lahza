import 'package:json_annotation/json_annotation.dart';

part 'repair_request.g.dart';

@JsonSerializable(includeIfNull: false)
class RepairRequest {
  final String issueType;
  final String description;
  final String phoneType;
  final String phoneModel;
  final String? otherIssue;
  final String? otherIssueDescription;

  const RepairRequest({
    required this.issueType,
    required this.description,
    required this.phoneType,
    required this.phoneModel,
    this.otherIssue,
    this.otherIssueDescription,
  });

  factory RepairRequest.fromJson(Map<String, dynamic> json) =>
      _$RepairRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RepairRequestToJson(this);
}