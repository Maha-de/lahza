import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lahza/core/constants/app_strings.dart';

class ImagePickerHelper {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickFromGallery() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 1280,
      );

      return image != null ? File(image.path) : null;
    } on PlatformException catch (e) {
      throw Exception(e.message ?? AppStrings.failedPickImageGallery);
    }
  }

  static Future<File?> pickFromCamera() async {
    try {
      final image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 1280,
      );

      return image != null ? File(image.path) : null;
    } on PlatformException catch (e) {
      throw Exception(e.message ?? AppStrings.failedCaptureImage);
    }
  }
}