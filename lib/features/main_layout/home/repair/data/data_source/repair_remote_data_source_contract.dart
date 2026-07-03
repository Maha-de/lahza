import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/features/main_layout/home/repair/data/models/responses/issue_type_response.dart';

abstract interface class RepairRemoteDataSourceContract {
  Future<BaseResponse<IssueTypesResponse>> getIssueTypes();
}
