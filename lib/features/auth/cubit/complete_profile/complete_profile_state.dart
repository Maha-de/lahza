import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/city_model.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/governorate_model.dart';

final class CompleteProfileState {
  final List<GovernorateModel> governorates;
  final List<CityModel> cities;

  final GovernorateModel? selectedGovernorate;
  final CityModel? selectedCity;
  final LatLng? selectedLocation;
  final bool isLoading;

  final ErrorModel? error;
  final CompleteProfileResponse? response;

  const CompleteProfileState({
    this.governorates = const [],
    this.cities = const [],
    this.selectedGovernorate,
    this.selectedCity,
    this.isLoading = false,
    this.error,
    this.response,
    this.selectedLocation,
  });

  CompleteProfileState copyWith({
    List<GovernorateModel>? governorates,
    List<CityModel>? cities,
    GovernorateModel? selectedGovernorate,
    CityModel? selectedCity,
    LatLng? selectedLocation,
    bool? isLoading,
    ErrorModel? error,
    CompleteProfileResponse? response,
  }) {
    return CompleteProfileState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      governorates: governorates ?? this.governorates,
      cities: cities ?? this.cities,
      selectedGovernorate: selectedGovernorate ?? this.selectedGovernorate,
      selectedCity: selectedCity ?? this.selectedCity,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      response: response,
    );
  }
}
