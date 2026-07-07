import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/offers/models/offers_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'offers_client.g.dart';


@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class OffersClient {
  @factoryMethod
  factory OffersClient(Dio dio) = _OffersClient;

  @GET(AppEndPoints.getOffers)
  Future<OffersModel> getOffers();

}
