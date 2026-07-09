import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/notifications/cubit/notifications_state.dart';
import 'package:lahza/features/notifications/models/notifications_model.dart';
import 'package:lahza/features/notifications/repositories/notifications_repository.dart';



@Injectable()
class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepository repository;

  NotificationsCubit({required this.repository}) : super(NotificationsInitial());

  void fetchNotifications() async {
    emit(NotificationsLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getNotifications());

    switch (response) {
      case SuccessBaseResponse<NotificationsModel>():
        final data = response.data;
        emit(NotificationsSuccess(notificationsModel: data.data));

      case ErrorBaseResponse<NotificationsModel>():
        emit(NotificationsError(errorModel: response.errorModel));
    }
  }


  void markAllAsRead() async {
    emit(NotificationsLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getNotifications());

    switch (response) {
      case SuccessBaseResponse<NotificationsModel>():
        final data = response.data;
        emit(NotificationsSuccess(notificationsModel: data.data));

      case ErrorBaseResponse<NotificationsModel>():
        emit(NotificationsError(errorModel: response.errorModel));
    }
  }

  void deleteAllNotifications() async {
    emit(NotificationsLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getNotifications());

    switch (response) {
      case SuccessBaseResponse<NotificationsModel>():
        final data = response.data;
        emit(NotificationsSuccess(notificationsModel: data.data));

      case ErrorBaseResponse<NotificationsModel>():
        emit(NotificationsError(errorModel: response.errorModel));
    }
  }

}



