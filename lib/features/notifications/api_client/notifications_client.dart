import 'package:dio/dio.dart';
import 'package:lahza/core/constants/app_end_points.dart';
import 'package:lahza/features/notifications/models/notification_response.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
part 'notifications_client.g.dart';

@injectable
@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class NotificationsClient {
  @factoryMethod
  factory NotificationsClient(Dio dio) = _NotificationsClient;

  @GET(AppEndPoints.getNotifications)
  Future<BasicResponse<List<NotificationsModel>>> getNotifications();

  @PATCH(AppEndPoints.readNotifications)
  Future<BasicResponse> markAsRead(@Path("id") String id);

  @PATCH(AppEndPoints.readAllNotifications)
  Future<BasicResponse> markAllAsRead();

  @DELETE(AppEndPoints.getNotifications)
  Future<BasicResponse> deleteAllNotifications();

}
