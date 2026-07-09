import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/auth/cubit/signup/signup_state.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/models/responses/register/register_response.dart';
import 'package:lahza/features/auth/repositories/auth_repository.dart';


@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository repository;

  RegisterCubit({
    required this.repository, 
  }) : super(RegisterInitial());

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.register(request),
    );

    if (response is SuccessBaseResponse<RegisterResponse>) {
      emit(RegisterSuccess(data: response.data));
    } else if (response is ErrorBaseResponse<RegisterResponse>) {
      emit(RegisterError(errorModel: response.errorModel));
    }
  }
}