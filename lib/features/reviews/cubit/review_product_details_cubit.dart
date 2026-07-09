import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_state.dart';
import 'package:lahza/features/reviews/models/review_phone_details_model.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';

@Injectable()
class ReviewProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ReviewsRepository repository;

  ReviewProductDetailsCubit(this.repository) : super(ProductDetailsInitial());

  void getProductDetails(String id) async {
    emit(ProductDetailsLoading());

    final response = await ErrorHandler.handleApiCall(() =>
        repository.getProductDetails(id));
    switch (response) {
      case SuccessBaseResponse<ReviewPhoneDetailsModel>():
        final data = response.data;
        emit(ProductDetailsSuccess(model: data));

      case ErrorBaseResponse<ReviewPhoneDetailsModel>():
        emit(ProductDetailsError(errorModel: response.errorModel));
    }
  }
}
