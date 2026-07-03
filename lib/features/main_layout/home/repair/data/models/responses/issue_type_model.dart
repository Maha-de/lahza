import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';

class IssueTypeModel {
  final String? value;
  final String? label;

  const IssueTypeModel({
    this.value,
    this.label,
  });

  factory IssueTypeModel.fromJson(Map<String, dynamic> json) {
    return IssueTypeModel(
      value: json['value'] as String?,
      label: json['label'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'label': label,
    };
  }

  IssueTypeEntity toEntity() {
    return IssueTypeEntity(
      value: value ?? '',
      label: label ?? '',
    );
  }
}