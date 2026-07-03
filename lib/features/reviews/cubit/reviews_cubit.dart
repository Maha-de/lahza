import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/exceptions.dart';
import 'package:lahza/features/reviews/cubit/reviews_state.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';

class PhoneReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepository repository;

  PhoneReviewsCubit({required this.repository}) : super(ReviewsInitial());

  void fetchReviews() async {
    emit(ReviewsLoading());
    try {
      final reviews = await repository.getReviews();
      emit(ReviewsSuccess(data: reviews.data));
    } on ServerException catch (e) {
      emit(ReviewsError(message: e.errModel.errorMessage)); // نرسل الخطأ
    } catch (e) {
      // هنا ستصل الأخطاء (ServerException أو أي خطأ آخر)
      emit(ReviewsError(message: "حدث خطأ ما، يرجى التأكد من اتصالك"));
    }
  }
}

