import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';
import 'package:retrofit/retrofit.dart';

part 'subscription_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class SubscriptionApiClient {
  @factoryMethod
  factory SubscriptionApiClient(Dio dio) = _SubscriptionApiClient;

  @POST(AppEndPoints.subscriptions)
  Future<SubscriptionResponse> createSubscription(@Body() FormData formData);
  @GET(AppEndPoints.subscriptionMe)
  Future<SubscriptionResponse> getMySubscription();
}
