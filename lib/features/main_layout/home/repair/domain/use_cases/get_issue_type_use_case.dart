import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';
import 'package:lahza/features/main_layout/home/repair/domain/repo/repair_repo_contract.dart';

@injectable
class GetIssueTypeUseCase {
  final RepairRepoContract _repairRepo;
  const GetIssueTypeUseCase(this._repairRepo);
  Future<BaseResponse<List<IssueTypeEntity>>> call() {
    return _repairRepo.getIssueTypes();
  }
}
