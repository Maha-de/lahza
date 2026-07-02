import 'package:lahza/features/main_layout/home/repair/data/models/responses/issue_type_model.dart';

class IssueTypesResponse {
  final bool? success;
  final List<IssueTypeModel>? data;

  const IssueTypesResponse({
    this.success,
    this.data,
  });

  factory IssueTypesResponse.fromJson(Map<String, dynamic> json) {
    return IssueTypesResponse(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IssueTypeModel.fromJson(e))
          .toList(),
    );
  }
}