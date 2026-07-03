import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/features/main_layout/home/repair/data/data_source/repair_remote_data_source_contract.dart';
import 'package:lahza/features/main_layout/home/repair/data/models/responses/issue_type_response.dart';
import 'package:lahza/features/main_layout/home/repair/domain/entities/issue_type_entity.dart';
import 'package:lahza/features/main_layout/home/repair/domain/repo/repair_repo_contract.dart';

// @Injectable(as: RepairRepoContract)
// class RepairRepoImpl implements RepairRepoContract {
//   final RepairRemoteDataSourceContract _remoteDataSource;
//   const RepairRepoImpl(this._remoteDataSource);
//
//   @override
//   Future<BaseResponse<List<IssueTypeEntity>>> getIssueTypes() async {
//     final response = await _remoteDataSource.getIssueTypes();
//     switch (response) {
//       case SuccessBaseResponse<IssueTypesResponse>():
//         return SuccessBaseResponse<List<IssueTypeEntity>>(
//           response.data.data?.map((e) => e.toEntity()).toList() ?? [],
//         );
//       case ErrorBaseResponse<IssueTypesResponse>():
//         return ErrorBaseResponse(response.errorMessage);
//     }
//   }
// }
