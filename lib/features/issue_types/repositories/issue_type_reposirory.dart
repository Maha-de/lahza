import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_keys.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/issue_types/api_client/issue_type_api_client.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_response.dart';

@LazySingleton()
class IssueTypeRepository {

  final IssueTypeApiClient apiClient;

  IssueTypeRepository({required this.apiClient});

  Future<IssueTypeResponse> getIssueTypes() async {
    final cachedData = CacheHelper.getData(key: AppKeys.cacheKey);

    if (cachedData != null) {
      return IssueTypeResponse.fromJson(jsonDecode(cachedData));
    }

    final response = await apiClient.getIssueTypes();

    await CacheHelper.saveData(
      key: AppKeys.cacheKey,
      value: jsonEncode(response.toJson()),
    );

    return response;
  }
}
