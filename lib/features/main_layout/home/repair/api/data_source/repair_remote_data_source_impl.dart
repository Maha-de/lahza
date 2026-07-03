import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/main_layout/home/repair/api/api_client/repair_api_client.dart';
import 'package:lahza/features/main_layout/home/repair/data/data_source/repair_remote_data_source_contract.dart';
import 'package:lahza/features/main_layout/home/repair/data/models/responses/issue_type_response.dart';

@Injectable(as: RepairRemoteDataSourceContract)
class RepairRemoteDataSourceImpl implements RepairRemoteDataSourceContract {
  final RepairApiClient _apiClient;
  const RepairRemoteDataSourceImpl(this._apiClient);
  @override
  Future<BaseResponse<IssueTypesResponse>> getIssueTypes() {
    return ErrorHandler.handleApiCall(() {
      return _apiClient.getIssueTypes();
    });
  }
}
