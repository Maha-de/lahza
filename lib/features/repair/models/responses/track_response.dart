import 'package:json_annotation/json_annotation.dart';

import 'track_model.dart';

part 'track_response.g.dart';

@JsonSerializable()
class TrackResponse {
  final bool? success;
  final TrackModel? data;

  const TrackResponse({this.success, this.data});

  factory TrackResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrackResponseToJson(this);
}
