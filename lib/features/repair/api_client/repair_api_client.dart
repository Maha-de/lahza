import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/repair/models/responses/confirm_response.dart';
import 'package:lahza/features/repair/models/responses/repair_response.dart';
import 'package:lahza/features/repair/models/responses/track_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'repair_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class RepairApiClient {
  @factoryMethod
  factory RepairApiClient(Dio dio) = _RepairApiClient;

  @GET(AppEndPoints.getRepairById)
  Future<RepairResponse> getRepairById(
    @Path('id') String repairId,
  );

  @POST(AppEndPoints.confirmRepair)
  Future<ConfirmResponse> confirmRepair(
    @Path('id') String repairId,
  );

  @GET(AppEndPoints.trackRepair)
  Future<TrackResponse> trackRepair(
    @Path('id') String repairId,
  );
}