import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/profile/cubit/profile_state.dart';
import 'package:lahza/features/profile/models/profile_model.dart';
import 'package:lahza/features/profile/repositories/profile_repository.dart';



@Injectable()
class ProfileCubit extends Cubit<ProfileState> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final ProfileRepository repository;

  ProfileCubit({required this.repository}) : super(ProfileInitial());

  void fetchMyProfile() async {
    emit(ProfileLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getProfile());

    switch (response) {
      case SuccessBaseResponse<ProfileModel>():
        final data = response.data;
        emit(ProfileSuccess(profileModel: data));

      case ErrorBaseResponse<ProfileModel>():
        emit(ProfileError(errorModel: response.errorModel));
    }
  }

  void updateProfileImage(XFile avatar) async {
    emit(ProfileLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.updateImageProfile(avatar));

    switch (response) {
      case SuccessBaseResponse<ProfileModel>():
        final data = response.data;
        emit(ProfileSuccess(profileModel: data));

      case ErrorBaseResponse<ProfileModel>():
        emit(ProfileError(errorModel: response.errorModel));
    }
  }

  void updateProfile(String? name, String? phoneNumber, String? password) async {
    emit(ProfileLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.editProfile(
      name: nameController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
    ));

    switch (response) {
      case SuccessBaseResponse<ProfileModel>():
        final data = response.data;
        emit(ProfileSuccess(profileModel: data));

      case ErrorBaseResponse<ProfileModel>():
        emit(ProfileError(errorModel: response.errorModel));
    }
  }

}



