import 'package:injectable/injectable.dart';
import 'package:lahza/features/repair/api_client/repair_api_client.dart';
import 'package:lahza/features/repair/models/responses/confirm_response.dart';
import 'package:lahza/features/repair/models/responses/repair_response.dart';
import 'package:lahza/features/repair/models/responses/track_response.dart';

@LazySingleton()
class RepairRepository {
  final RepairApiClient _apiClient;

  RepairRepository(this._apiClient);

  Future<RepairResponse> getRepairById(String repairId) {
    return _apiClient.getRepairById(repairId);
  }

  Future<ConfirmResponse> confirmRepair(String repairId) {
    return _apiClient.confirmRepair(repairId);
  }

  Future<TrackResponse> trackRepair(String repairId) {
    return _apiClient.trackRepair(repairId);
  }
}
