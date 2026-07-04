import 'package:json_annotation/json_annotation.dart';
part 'issue_type_model.g.dart';

@JsonSerializable()
class IssueTypeModel {
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "label")
  String? label;

  IssueTypeModel({this.value, this.label});

  factory IssueTypeModel.fromJson(Map<String, dynamic> json) =>
      _$IssueTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$IssueTypeModelToJson(this);
}
