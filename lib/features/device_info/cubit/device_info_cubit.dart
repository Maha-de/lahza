import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/helpers/image_picker_helper.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/features/device_info/cubit/device_info_state.dart';
import 'package:lahza/features/device_info/models/request/repair_request.dart';
import 'package:lahza/features/device_info/repositories/device_info_repoditory.dart';

@injectable
class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  final DeviceInfoRepoditory _repository;

  DeviceInfoCubit(this._repository) : super(const DeviceInfoInitial());

  File? selectedImage;

  Future<void> pickImageFromGallery() async {
    try {
      final image = await ImagePickerHelper.pickFromGallery();

      if (image == null) return;

      selectedImage = image;
      emit(DeviceImagePicked(image));
    } catch (e) {
      emit(DeviceInfoFailure(e.toString()));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final image = await ImagePickerHelper.pickFromCamera();

      if (image == null) return;

      selectedImage = image;
      emit(DeviceImagePicked(image));
    } catch (e) {
      emit(DeviceInfoFailure(e.toString()));
    }
  }

  Future<void> submitRepairRequest(RepairRequest request) async {
    if (selectedImage == null) {
      emit(const DeviceInfoFailure('يرجى اختيار صورة'));
      return;
    }

    emit(const DeviceInfoLoading());

    try {
      final response = await _repository.createRepair(
        request: request,
        attachment: AppMultipartFile.fromPath(selectedImage!.path),
      );

      emit(DeviceInfoSuccess(response));
    } catch (e) {
      emit(DeviceInfoFailure(e.toString()));
    }
  }

  void removeImage() {
    selectedImage = null;
    emit(const DeviceInfoInitial());
  }
}
