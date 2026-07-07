import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/offers/cubit/offers_state.dart';
import 'package:lahza/features/offers/models/offers_model.dart';
import 'package:lahza/features/offers/repositories/offers_repository.dart';

@Injectable()
class OffersCubit extends Cubit<OffersState> {
  final OffersRepository repository;

  OffersCubit({required this.repository}) : super(OffersInitial());

  void fetchOffers() async {
    emit(OffersLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getOffers());

    switch (response) {
      case SuccessBaseResponse<OffersModel>():
        final data = response.data;
        emit(OffersSuccess(offersModel: data.data));

      case ErrorBaseResponse<OffersModel>():
        emit(OffersError(errorModel: response.errorModel));
    }
  }
}



