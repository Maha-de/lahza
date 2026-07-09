import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/features/device_info/models/request/repair_request.dart';

@singleton
class MultipartService {
  Future<FormData> createRepairFormData({
    required RepairRequest request,
    required AppMultipartFile attachment,
  }) async {
    return FormData.fromMap({
      ...request.toJson(),
      'attachment': await attachment.toMultipartFile(),
    });
  }
}