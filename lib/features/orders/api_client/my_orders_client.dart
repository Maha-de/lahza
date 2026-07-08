import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'my_orders_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class MyOrdersClient {
  @factoryMethod
  factory MyOrdersClient(Dio dio) = _MyOrdersClient;

  @GET(AppEndPoints.getMyOrders)
  Future<MyOrdersModel> getMyOrders();

}
