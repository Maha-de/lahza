import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/core/services/facebook_auth_service.dart';
import 'package:lahza/core/services/google_auth_service.dart';
import 'package:lahza/features/auth/cubit/login/login_state.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;
  final GoogleAuthService googleAuthService;
  final FacebookAuthService facebookAuthService;

  LoginCubit({
    required this.repository,
    required this.googleAuthService,required this.facebookAuthService
  }) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.login(request),
    );

    if (response is SuccessBaseResponse<LoginResponse>) {
      emit(LoginSuccess(data: response.data));
    } else if (response is ErrorBaseResponse<LoginResponse>) {
      emit(LoginError(errorModel: response.errorModel));
    }
  }

Future<void> googleLogin() async {
  emit(LoginLoading());

  try {
    final googleUser = await googleAuthService.signIn();

    if (googleUser == null) {
      emit(LoginInitial());
      return;
    }

    print('========== GOOGLE USER ==========');
print('ID TOKEN: ${googleUser.idToken}');
print('ACCESS TOKEN: ${googleUser.accessToken}');
print('EMAIL: ${googleUser.email}');
print('NAME: ${googleUser.name}');
print('PHOTO: ${googleUser.image}');
print('================================');

    // وقف هنا مؤقتًا لحد ما نتأكد إن الـ idToken طلع
    emit(LoginInitial());

    // بعد كده هنرجع الجزء ده
    /*
    final response = await ErrorHandler.handleApiCall(
      () => repository.googleLogin(
        GoogleLoginRequest(
          idToken: googleUser.idToken,
        ),
      ),
    );

    if (response is SuccessBaseResponse<LoginResponse>) {
      emit(LoginSuccess(data: response.data));
    } else if (response is ErrorBaseResponse<LoginResponse>) {
      emit(LoginError(errorModel: response.errorModel));
    }
    */
  } catch (e, s) {
    print(e.toString());
    print(s.toString());
    emit(LoginInitial());
  }
}
Future<void> facebookLogin() async {
  final result = await facebookAuthService.signIn();

  if (result.status == LoginStatus.success) {
    final data = await facebookAuthService.getUserData();

    print("========== FACEBOOK ==========");
    print("ACCESS TOKEN: ${result.accessToken?.tokenString}");
    print("USER ID: ${data['id']}");
    print("NAME: ${data['name']}");
    print("EMAIL: ${data['email']}");
    print("PHOTO: ${data['picture']['data']['url']}");
    print("==============================");
  } else {
    print(result.status);
    print(result.message);
  }
}
}