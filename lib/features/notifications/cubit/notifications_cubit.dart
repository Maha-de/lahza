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

  NotificationsCubit({required this.repository})
    : super(NotificationsInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationsLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getNotifications(),
    );

    switch (response) {
      case SuccessBaseResponse<List<NotificationsModel>>():
        final data = response.data;
        emit(NotificationsSuccess(notificationsModel: List.from(data ?? [])));

      case ErrorBaseResponse<List<NotificationsModel>>():
        emit(NotificationsError(errorModel: response.errorModel));
    }
  }

  void markAsRead(String id) async {
    emit(MarkAsReadLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.markAsRead(id),
    );

    switch (response) {
      case SuccessBaseResponse():
        emit(MarkAsReadSuccess());
        await fetchNotifications();

      case ErrorBaseResponse():
        emit(MarkAsReadError(errorModel: response.errorModel));
    }
  }

  void markAllAsRead() async {
    emit(BatchActionLoading());

    final response = await ErrorHandler.handleApiCall(
          () => repository.markAllAsRead(),
    );

    switch (response) {
      case SuccessBaseResponse():
        // emit(BatchActionSuccess());
        await fetchNotifications();

      case ErrorBaseResponse():
        emit(BatchActionError(errorModel: response.errorModel));
    }
  }

  void deleteAllNotifications() async {
    emit(BatchActionLoading());

    final response = await ErrorHandler.handleApiCall(
          () => repository.deleteAllNotifications(),
    );

    switch (response) {
      case SuccessBaseResponse():
        // emit(BatchActionSuccess());
         await fetchNotifications();

      case ErrorBaseResponse():
        emit(BatchActionError(errorModel: response.errorModel));
    }
  }

}
