import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_details_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_favorite_status_response.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'buy_phone_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class BuyPhoneApiClient {
  @factoryMethod
  factory BuyPhoneApiClient(Dio dio) = _BuyPhoneApiClient;

  @GET(AppEndPoints.products)
  Future<BuyPhoneResponse> getProducts();

  @GET(AppEndPoints.productDetails)
  Future<BuyPhoneDetailsResponse> getProductById(@Path('id') String id);

  @POST(AppEndPoints.toggleFavorite)
  Future<BuyPhoneFavoriteStatusResponse> toggleFavorite(@Path('id') String id);

  @GET(AppEndPoints.favorites)
  Future<BuyPhoneFavoriteResponse> getFavorites();
}
