import 'package:json_annotation/json_annotation.dart';
part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(fromJson: _toInt)
  final int id;

  @JsonKey(name: 'governorate_id', fromJson: _toInt)
  final int governorateId;

  @JsonKey(name: 'city_name_ar')
  final String cityNameAr;

  @JsonKey(name: 'city_name_en')
  final String cityNameEn;

  CityModel({
    required this.id,
    required this.governorateId,
    required this.cityNameAr,
    required this.cityNameEn,
  });

  static int _toInt(dynamic value) => int.parse(value.toString());

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}