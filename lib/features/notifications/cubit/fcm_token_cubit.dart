import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:lahza/features/notifications/cubit/fcm_token_state.dart';
import 'package:lahza/features/notifications/repositories/notifications_repository.dart';

class FcmTokenCubit extends Cubit<FcmTokenState> {
  final NotificationsRepository repository; // استخدمي نفس الريبوزيتوري الموجودة عندك

  FcmTokenCubit({required this.repository}) : super(FcmTokenInitial());
  //
  // Future<void> sendFcmTokenToServer() async {
  //   emit(FcmTokenLoading());
  //   try {
  //     // 1. جلب التوكن من Firebase
  //     String? token = await FirebaseMessaging.instance.getToken();
  //
  //     if (token != null) {
  //       // 2. إرسال التوكن للباكيند (يجب أن تكون هذه الدالة موجودة في الـ Repository)
  //       await repository.updateFcmToken(token);
  //       emit(FcmTokenSuccess());
  //     } else {
  //       emit(FcmTokenError("لم يتم الحصول على توكن من Firebase"));
  //     }
  //   } catch (e) {
  //     emit(FcmTokenError(e.toString()));
  //   }
  // }

}