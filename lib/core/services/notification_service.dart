import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // هذه الدالة تعمل عندما يكون التطبيق مغلقاً تماماً
  print("تم استقبال إشعار في الخلفية: ${message.messageId}");
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static final StreamController<RemoteMessage> notificationStream = StreamController.broadcast();

  static Future<void> initialize() async {

    // أضيفي هذا السطر داخل دالة initialize في NotificationService
    String? token = await FirebaseMessaging.instance.getToken();
    print("My Device FCM Token: $token"); // انسخي هذا الكود من الـ Terminal

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // 1. إعداد الإشعارات المحلية (لإظهار التنبيه أثناء فتح التطبيق)
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

    await _localNotificationsPlugin.initialize(settings: initializationSettings);

    // طلب الإذن
    await FirebaseMessaging.instance.requestPermission();

    // الاستماع للإشعارات أثناء فتح التطبيق (Foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showLocalNotification(message);
        // أرسلي الإشعار للـ Stream هنا
        notificationStream.add(message);
      }
    });

  }

  static Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'high_importance_channel',
      'Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await _localNotificationsPlugin.show(
      id: message.hashCode,
      title: message.notification?.title,
      body: message.notification?.body,
      notificationDetails: platformChannelSpecifics,
    );
  }
}