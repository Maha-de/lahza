import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/auth/cubit/login/login_state.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/models/responses/login/login_response.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginCubit({
    required this.repository,
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
}
