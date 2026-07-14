import 'package:json_annotation/json_annotation.dart';
part 'my_orders_model.g.dart';

@JsonSerializable()

class MyOrdersModel {
  String? id;
  String? requestNumber;
  String? phoneType;
  String? phoneModel;
  String? issueType;
  String? diagnosisResult;
  String? status;
  List<String>? attachments;
  DateTime? createdAt;

  MyOrdersModel({
    this.id,
    required this.requestNumber,
    required this.phoneType,
    required this.phoneModel,
    required this.issueType,
    this.diagnosisResult,
    required this.status,
    this.attachments,
    required this.createdAt,
  });


  factory MyOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyOrdersModelToJson(this);

}
