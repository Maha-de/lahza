import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/cache_helper.dart';
import 'package:lahza/features/notifications/api_client/notifications_client.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';
import 'dart:convert';



@LazySingleton()
class NotificationsRepository {
  final NotificationsClient client;

  NotificationsRepository({required this.client});

  Future<NotificationsModel> getNotifications() async {
    try {
      final response = await client.getNotifications();

      await CacheHelper.saveData(key: 'cached_Notifications', value: jsonEncode(response.toJson()));

      return response;
    } catch (e) {
      final cachedData = CacheHelper.getData(key: 'cached_Notifications');
      if (cachedData != null) {
        return NotificationsModel.fromJson(jsonDecode(cachedData));
      } else {
        rethrow;
      }
    }
  }

//   // في الـ Repository
// Future<BaseResponse<BasicResponse>> markAllAsRead() async {
//   return await ErrorHandler.handleApiCall(() => apiClient.markAllAsRead());
// }


//   Future<NotificationsModel> markAsRead() async {
//     try {
//       final response = await client.getNotifications();
//
//       await CacheHelper.saveData(key: 'cached_Notifications', value: jsonEncode(response.toJson()));
//
//       return response;
//     } catch (e) {
//       final cachedData = CacheHelper.getData(key: 'cached_Notifications');
//       if (cachedData != null) {
//         return NotificationsModel.fromJson(jsonDecode(cachedData));
//       } else {
//         rethrow;
//       }
//     }
//   }

// Future<BaseResponse> markAllAsRead() async {
//     try {
//       final response = await client.getNotifications();
//
//       await CacheHelper.saveData(key: 'cached_Notifications', value: jsonEncode(response.toJson()));
//
//       return response;
//     } catch (e) {
//       final cachedData = CacheHelper.getData(key: 'cached_Notifications');
//       if (cachedData != null) {
//         return NotificationsModel.fromJson(jsonDecode(cachedData));
//       } else {
//         rethrow;
//       }
//     }
//   }

// Future<BaseResponse> deleteAllNotifications() async {
//     try {
//       final response = await client.getNotifications();
//
//       await CacheHelper.saveData(key: 'cached_Notifications', value: jsonEncode(response.toJson()));
//
//       return response;
//     } catch (e) {
//       final cachedData = CacheHelper.getData(key: 'cached_Notifications');
//       if (cachedData != null) {
//         return NotificationsModel.fromJson(jsonDecode(cachedData));
//       } else {
//         rethrow;
//       }
//     }
//   }

}