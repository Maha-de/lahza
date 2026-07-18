import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/core/services/secure_storage_service.dart';
import 'package:lahza/features/payment/repositories/subscription_repository.dart';
import 'package:lahza/features/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SecureStorageService _secureStorageService;
  final SubscriptionRepository _repository;

  SplashCubit(
      this._secureStorageService,
      this._repository,
      ) : super(const SplashInitial());

  Future<void> checkUser() async {
    emit(const SplashLoading());

    await Future.delayed(const Duration(milliseconds: 2500));

    final token = await _secureStorageService.getAccessToken();

    if (token == null || token.isEmpty) {
      emit(const SplashGoToOnBoarding());
      return;
    }

    final response = await ErrorHandler.handleApiCall(
          () => _repository.getMySubscription(),
    );

    switch (response) {
      case SuccessBaseResponse():
        print("SUCCESS");
        print("SUCCESS FLAG => ${response.data.success}");
        print("MESSAGE => ${response.data.message}");
        print("STATUS => ${response.data.data.status}");
        final status = response.data.data.status.toUpperCase();

        switch (status) {
          case 'ACTIVE':
            emit(const SplashGoToHome());
            break;

          case 'PENDING':
            emit(const SplashGoToPending());
            break;

          case 'CANCELED':
          case 'CANCELLED':
          case 'REJECTED':
            emit(const SplashGoToPayment());
            break;

          default:
            print("UNKNOWN STATUS => $status");
            emit(const SplashGoToPayment());
            break;
        }

      case ErrorBaseResponse():
        print("ERROR => ${response.errorModel.errorMessage}");
        final message =
        response.errorModel.errorMessage.toLowerCase();

        if (message.contains("permission")) {
          emit(const SplashGoToPayment());
        } else {
          emit(const SplashGoToLogin());
        }
    }
  }
}