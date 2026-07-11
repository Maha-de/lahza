import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/core/services/image_uploader/upload_image_to_api.dart';
import 'package:lahza/features/profile/api_client/profile_client.dart';
import 'dart:convert';
import 'package:lahza/features/profile/models/profile_model.dart';

@LazySingleton()
class ProfileRepository {
  final ProfileClient client;

  ProfileRepository({required this.client});

  Future<ProfileModel> getProfile() async {
    try {
      final response = await client.getProfile();

      await CacheHelper.saveData(
        key: 'cached_profile',
        value: jsonEncode(response.toJson()),
      );

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_profile');
      if (cachedData != null) {
        return ProfileModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

  Future<ProfileModel> updateImageProfile(XFile avatar) async {
    try {
      final multipartFile = await uploadImageToApi(avatar);

      final response = await client.updateImageProfile(avatar: multipartFile);

      await CacheHelper.saveData(
        key: 'cached_image_profile',
        value: jsonEncode(response.toJson()),
      );

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_image_profile');
      if (cachedData != null) {
        return ProfileModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

  Future<ProfileModel> editProfile({
    String? name,
    String? phone,
    String? password,
  }) async {
    try {

      print("DEBUG: Repository received: $name, $phone, $password");

      final body = {
        "fullName": name,
        "phone": phone,
        "password": password,
      };
      final response = await client.editProfile(body);

      await CacheHelper.saveData(
        key: 'cached_edit_profile',
        value: jsonEncode(response.toJson()),
      );

      return response;
    } catch (e) {
      // final cachedData = CacheHelper.getData(key: 'cached_edit_profile');
      // if (cachedData != null) {
      //   return ProfileModel.fromJson(jsonDecode(cachedData));
      // } else {
        rethrow;
      // }
    }
  }
}
