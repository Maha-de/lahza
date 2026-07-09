import 'package:json_annotation/json_annotation.dart';
part 'notification_response.g.dart';


@JsonSerializable()
class BasicResponse {
  final bool status;
  final String message;

  BasicResponse({required this.status, required this.message});
  factory BasicResponse.fromJson(Map<String, dynamic> json) => _$BasicResponseFromJson(json);
}