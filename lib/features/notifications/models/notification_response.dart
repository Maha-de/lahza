import 'package:json_annotation/json_annotation.dart';
part 'notification_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
// class BasicResponse<T> {
//   final bool? status;
//   final String? message;
//   final T? data;
//
//   BasicResponse({required this.status, required this.message, this.data});
//
//   factory BasicResponse.fromJson(
//     Map<String, dynamic> json,
//     T Function(Object? json) fromJsonT,
//   ) => _$BasicResponseFromJson(json, fromJsonT);
// }


@JsonSerializable(genericArgumentFactories: true)
class BasicResponse<T> {
  final bool? status;
  final bool? success;
  final String? message;
  final int? count;
  final T? data;

  BasicResponse({
    this.status,
    this.success,
    this.message,
    this.count,
    this.data,
  });

  // تفحص هل الـ status أو الـ success أي منهما بـ true
  bool get isSuccess => (status ?? success) ?? false;

  factory BasicResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$BasicResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasicResponseToJson(this, toJsonT);
}
