import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/buy_phone/cubit/phone_details/phone_details_state.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_details_response.dart';
import 'package:lahza/features/buy_phone/repositories/buy_phone_repository.dart';

@injectable
class BuyPhoneDetailsCubit extends Cubit<BuyPhoneDetailsState> {
  final BuyPhoneRepository repository;

  BuyPhoneDetailsCubit({required this.repository})
    : super(BuyPhoneDetailsInitial());

  Future<void> getProductDetails(String id) async {
    emit(BuyPhoneDetailsLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getProductById(id),
    );

    if (response is ErrorBaseResponse<BuyPhoneDetailsResponse>) {
      emit(BuyPhoneDetailsError(errorModel: response.errorModel));
      return;
    }

    final success = response as SuccessBaseResponse<BuyPhoneDetailsResponse>;

    emit(BuyPhoneDetailsSuccess(product: success.data.data!));
  }
}
