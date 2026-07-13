import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/device_info/models/response/repair_response.dart';
import 'package:retrofit/retrofit.dart';

part 'device_info_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class DeviceInfoApiClient {
  @factoryMethod
  factory DeviceInfoApiClient(Dio dio) = _DeviceInfoApiClient;
  // @POST(AppEndPoints.creatRepair)
  // Future<RepairResponse> createRepair(@Body() FormData formData);
}
