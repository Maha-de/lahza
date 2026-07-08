import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/core/services/location_service.dart';
import 'package:lahza/features/auth/cubit/complete_profile/complete_profile_state.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/city_model.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/complete_profile_response.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/governorate_model.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@Injectable()
class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  final AuthRepository repository;
  final LocationService locationService;
  GoogleMapController? mapController;
  CompleteProfileCubit({
    required this.repository,
    required this.locationService,
  }) : super(const CompleteProfileState());

  late final List<GovernorateModel> _allGovernorates;
  late final List<CityModel> _allCities;

  Future<void> loadLocations() async {
    _allGovernorates = await locationService.getGovernorates();
    _allCities = await locationService.getCities();

    emit(state.copyWith(governorates: _allGovernorates));
  }

  void selectGovernorate(GovernorateModel governorate) {
    final cities = _allCities
        .where((city) => city.governorateId == governorate.id)
        .toList();

    emit(
      state.copyWith(
        selectedGovernorate: governorate,
        selectedCity: null,
        cities: cities,
      ),
    );
  }

  void selectCity(CityModel city) {
    emit(state.copyWith(selectedCity: city));
  }

  Future<void> completeProfile(CompleteProfileRequest request) async {
    emit(state.copyWith(isLoading: true, error: null));

    final response = await ErrorHandler.handleApiCall(
      () => repository.completeProfile(request),
    );

    if (response is SuccessBaseResponse<CompleteProfileResponse>) {
      emit(state.copyWith(isLoading: false, response: response.data));
    } else if (response is ErrorBaseResponse<CompleteProfileResponse>) {
      emit(state.copyWith(isLoading: false, error: response.errorModel));
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();

    final location = LatLng(position.latitude, position.longitude);

    emit(state.copyWith(selectedLocation: location));

    mapController?.animateCamera(CameraUpdate.newLatLngZoom(location, 16));
  }

  void changeLocation(LatLng location) {
  emit(state.copyWith(selectedLocation: location));

  mapController?.animateCamera(
    CameraUpdate.newLatLng(location),
  );
}
}
