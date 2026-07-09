import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/core/services/image_uploader/multi_part_services.dart';
import 'package:lahza/features/device_info/api_client/device_info_api_client.dart';
import 'package:lahza/features/device_info/models/request/repair_request.dart';
import 'package:lahza/features/device_info/models/response/repair_response.dart';

@LazySingleton()
class DeviceInfoRepoditory {
  final DeviceInfoApiClient apiClient;
  final MultipartService multipartService;

  DeviceInfoRepoditory({
    required this.apiClient,
    required this.multipartService,
  });

  Future<RepairResponse> createRepair({
    required RepairRequest request,
    required AppMultipartFile attachment,
  }) async {
    final formData = await multipartService.createRepairFormData(
      request: request,
      attachment: attachment,
    );

    return apiClient.createRepair(formData);
  }
}
