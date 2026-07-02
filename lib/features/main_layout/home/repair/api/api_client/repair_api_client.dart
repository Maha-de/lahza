import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/main_layout/home/repair/data/models/responses/issue_type_response.dart';
import 'package:retrofit/retrofit.dart';
part 'repair_api_client.g.dart';

@injectable
@RestApi()
abstract class RepairApiClient {
  @factoryMethod
  factory RepairApiClient(Dio dio) = _RepairApiClient;
  @GET(AppEndPoints.issueType)
  Future<IssueTypesResponse> getIssueTypes();
}
