import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/features/notifications/api_client/notifications_client.dart';
import 'package:lahza/features/notifications/models/notification_response.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';



@LazySingleton()
class NotificationsRepository {
  final NotificationsClient client;

  NotificationsRepository({required this.client});

  Future<List<NotificationsModel>> getNotifications() async {
    try {
      final response = await client.getNotifications();

      return response.data ?? [];
    } catch (e) {
      rethrow;
    }
  }


//   // في الـ Repository
// Future<BaseResponse<BasicResponse>> markAllAsRead() async {
//   return await ErrorHandler.handleApiCall(() => apiClient.markAllAsRead());
// }


  Future<BasicResponse> markAsRead(String id) async {
    try {
      final response = await client.markAsRead(id);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<BasicResponse> markAllAsRead() async {
    try {
      final response = await client.markAllAsRead();

      return response;
    } catch (e) {
      rethrow;
    }
  }


  Future<BasicResponse> deleteAllNotifications() async {
    try {
      final response = await client.deleteAllNotifications();

      return response;
    } catch (e) {
      rethrow;
    }
  }
  //
  // Future<void> updateFcmToken(String token) async {
  //   // افترضي أن لديك دالة في الـ client الخاص بك تقوم بإرسال التوكن
  //   await client.updateFcmToken({"fcm_token": token});
  // }

  Future<String?> getFcmToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // طلب إذن الإشعارات (لـ iOS وأندرويد 13+)
    NotificationSettings settings = await messaging.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String? token = await messaging.getToken();
      print("Firebase Token: $token");
      return token; // أرسلي هذا التوكن للباكيند فوراً
    }
    return null;
  }


}