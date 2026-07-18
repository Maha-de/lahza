import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/secure_storage_service.dart';
import 'package:lahza/features/splash/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SecureStorageService _secureStorageService;

  SplashCubit(this._secureStorageService) : super(const SplashInitial());

  Future<void> checkUser() async {
    emit(const SplashLoading());

    await Future.delayed(const Duration(milliseconds: 2500));

    final token = await _secureStorageService.getAccessToken();

    if (token == null || token.isEmpty) {
      emit(const SplashGoToOnBoarding());
      return;
    }

    final status = await _secureStorageService.getSubscriptionStatus();

    if (status == null) {
      emit(const SplashGoToLogin());
      return;
    }

    switch (status.toUpperCase()) {
      case 'ACTIVE':
        emit(const SplashGoToHome());
        break;

      case 'PENDING':
        emit(const SplashGoToPending());
        break;

      case 'NONE':
      case 'REJECTED':
      case 'CANCELED':
      case 'CANCELLED':
        emit(const SplashGoToPayment());
        break;

      default:
        emit(const SplashGoToLogin());
        break;
    }
  }
}
