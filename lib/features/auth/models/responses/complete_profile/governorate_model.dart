import 'package:json_annotation/json_annotation.dart';

part 'governorate_model.g.dart';

@JsonSerializable()
class GovernorateModel {
  final int id;

  @JsonKey(name: 'nameAr')
  final String governorateNameAr;

  @JsonKey(name: 'nameEn')
  final String governorateNameEn;

  GovernorateModel({
    required this.id,
    required this.governorateNameAr,
    required this.governorateNameEn,
  });

  factory GovernorateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernorateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernorateModelToJson(this);
}