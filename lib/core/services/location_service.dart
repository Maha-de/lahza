import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/city_model.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/governorate_model.dart';
@lazySingleton
class LocationService {
  Future<List<GovernorateModel>> getGovernorates() async {
  final jsonString = await rootBundle.loadString(
    'assets/json/governorates.json',
  );

  final List<dynamic> data = json.decode(jsonString);

  return data
      .map((e) => GovernorateModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

Future<List<CityModel>> getCities() async {
  final jsonString = await rootBundle.loadString(
    'assets/json/cities.json',
  );

  final List<dynamic> data = json.decode(jsonString);

  return data
      .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList();
}
}
