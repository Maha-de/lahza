import 'dart:convert';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/core/network/error_model.dart';
import 'package:lahza/features/auth/cubit/login/login_state.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit({required this.repository}) : super(LoginInitial());

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

  void signInWithGoogle() async {
    emit(LoginLoading());

    // 1. استدعاء الـ SDK الخاص بجوجل للحصول على التوكن
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId:
      "1018139837981-vtsut4qshpqjusec9gvc323htj1j3ub0.apps.googleusercontent.com",

      // '918559929805-23r1hl787kpf4cq763q34ebd2oa959d5.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // إذا ألغى المستخدم تسجيل الدخول
      return;
    }
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;
    final String? idToken = googleAuth.idToken;

    if (idToken == null) {
      // يمكنكِ تعديل هذه الجزئية لتناسب طريقة عرض الخطأ لديكِ إذا لزم الأمر
      return;
    }

    if (idToken != null) {
// كود فك التوكن لطباعة محتواه بالكامل
      final parts = idToken.split('.');
      if (parts.length > 1) {
        final payload = utf8.decode(
            base64Url.decode(base64Url.normalize(parts[1])));
        print("========== GOOGLE ID TOKEN PAYLOAD ==========");
        print(payload);
        print("=============================================");
      }

      // تأكدي أنكِ تمررين الـ idToken مع علامة التعجب هنا بعد التحقق منه
      final response = await repository.socialLogin(token: idToken);

      emit(LoginSuccess(data: response));
    }
  }

  //
  // void signInWithFacebook() async {
  //   emit(LoginLoadingState());
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       final response = await repository.socialLogin(
  //         provider: "facebook",
  //         token: result.accessToken!.token,
  //       );
  //       emit(LoginSuccessState(response));
  //     } else {
  //       emit(LoginErrorState("فشل تسجيل الدخول بفيسبوك"));
  //     }
  //   } catch (e) {
  //     emit(LoginErrorState(e.toString()));
  //   }
  // }
}
