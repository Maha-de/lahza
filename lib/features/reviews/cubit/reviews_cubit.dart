import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/reviews/cubit/reviews_state.dart';
import 'package:lahza/features/reviews/models/review_phones_model.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';

// @Injectable()
//
// class PhoneReviewsCubit extends Cubit<ReviewsState> {
//   final ReviewsRepository repository;
//
//   PhoneReviewsCubit({required this.repository}) : super(ReviewsInitial());
//
//   void fetchReviews() async {
//     emit(ReviewsLoading());
//     try {
//       final reviews = await repository.getReviews();
//       emit(ReviewsSuccess(data: reviews.data));
//     } on ServerException catch (e) {
//       emit(ReviewsError(message: e.errModel.errorMessage));
//     } catch (e) {
//       emit(ReviewsError(message: "حدث خطأ ما، يرجى التأكد من اتصالك"));
//     }
//   }
// }

@Injectable()
class PhoneReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepository repository;

  PhoneReviewsCubit({required this.repository}) : super(ReviewsInitial());

  void fetchReviews() async {
    emit(ReviewsLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getReviews());

    // if (response is SuccessBaseResponse) {
    //   emit(ReviewsSuccess(data: (response.data as ReviewPhonesModel).data));


    if (response is SuccessBaseResponse<ReviewPhonesModel>) {
      final model = (response as SuccessBaseResponse<ReviewPhonesModel>).data;

      emit(ReviewsSuccess(data: model.data));


    } else if (response is ErrorBaseResponse) {
      emit(ReviewsError(errorModel: (response as ErrorBaseResponse).errorModel));
    }
  }
}

// class PhoneReviewsCubit extends Cubit<ReviewsState> {
//   final ReviewsRepository repository;
//
//   PhoneReviewsCubit({required this.repository}) : super(ReviewsInitial());
//
//   void fetchReviews() async {
//     emit(ReviewsLoading());
//
//     final response = await ErrorHandler.handleApiCall(() => repository.getReviews());
//
//     // if (response is SuccessBaseResponse) {
//     //   emit(ReviewsSuccess(data: response.data));
//     // } else if (response is ErrorBaseResponse) {
//     //   // الآن نرسل الـ errorModel بالكامل للحالة
//     //   emit(ReviewsError(errorModel: response.errorModel));
//     // }
//
//
//     //       emit(ReviewsSuccess(data: (response as SuccessBaseResponse).data));
//     //     } else if (response is ErrorBaseResponse) {
//     //       // هنا استلام كائن الخطأ الموحد
//     //       emit(ReviewsError(errorModel: (response as ErrorBaseResponse).errorModel));
//     //     }
//     //   }
//     // }
//   }
// }

