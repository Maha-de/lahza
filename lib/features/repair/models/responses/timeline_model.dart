import 'package:json_annotation/json_annotation.dart';

part 'timeline_model.g.dart';

@JsonSerializable()
class TimelineModel {
  final String? status;
  final String? label;

  final bool? completed;
  final bool? current;

  const TimelineModel({this.status, this.label, this.completed, this.current});

  factory TimelineModel.fromJson(Map<String, dynamic> json) =>
      _$TimelineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimelineModelToJson(this);
}
