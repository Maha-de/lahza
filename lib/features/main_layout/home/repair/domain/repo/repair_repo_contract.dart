import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';

abstract interface class RepairRepoContract {
  Future<BaseResponse<List<IssueTypeEntity>>> getIssueTypes();
}
