import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/core/network/api_consumer.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_response.dart';

@LazySingleton()
class IssueTypeRepository {
  static const String _cacheKey = 'cached_issue_types';

  final ApiConsumer api;

  IssueTypeRepository({required this.api});

  Future<IssueTypesResponse> getIssueTypes() async {
    final cachedData = CacheHelper.getData(key: _cacheKey);

    if (cachedData != null) {
      return IssueTypesResponse.fromJson(jsonDecode(cachedData));
    }

    final response = await api.get(AppEndPoints.issueType);

    await CacheHelper.saveData(key: _cacheKey, value: jsonEncode(response));

    return IssueTypesResponse.fromJson(response);
  }
}
