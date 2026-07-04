import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/reviews/cubit/reviews_state.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';

@Injectable()
class PhoneReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepository repository;

  PhoneReviewsCubit({required this.repository}) : super(ReviewsInitial());

  void fetchReviews() async {
    emit(ReviewsLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getReviews());

    // if (response is SuccessBaseResponse) {
    //   emit(ReviewsSuccess(data: (response.data as ReviewPhonesModel).data));

        switch (response) {
          case SuccessBaseResponse<ReviewPhonesModel>():
            final data = response.data;
            emit(ReviewsSuccess(data: data.data));

          case ErrorBaseResponse<ReviewPhonesModel>():
            emit(ReviewsError(errorModel: response.errorModel));
        }
      }
    }



