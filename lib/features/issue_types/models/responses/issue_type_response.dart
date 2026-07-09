import 'package:json_annotation/json_annotation.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_model.dart';
part 'issue_type_response.g.dart';

@JsonSerializable()
class IssueTypeResponse {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  List<IssueTypeModel>? data;

  IssueTypeResponse({this.success, this.data});

  factory IssueTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$IssueTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IssueTypeResponseToJson(this);
}
