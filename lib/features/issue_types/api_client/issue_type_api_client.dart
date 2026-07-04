import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_response.dart';
import 'package:retrofit/retrofit.dart';

part 'issue_type_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class IssueTypeApiClient {
  @factoryMethod
  factory IssueTypeApiClient(Dio dio) = _IssueTypeApiClient;
@GET(AppEndPoints.issueType)
Future<IssueTypeResponse> getIssueTypes();
}