import 'package:json_annotation/json_annotation.dart';
part 'notification_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasicResponse<T> {
  final bool? status;
  final String? message;
  final T? data;

  BasicResponse({required this.status, required this.message, this.data});

  factory BasicResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BasicResponseFromJson(json, fromJsonT);
}
