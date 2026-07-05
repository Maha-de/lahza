import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/reviews/cubit/product_specs_state.dart';
import 'package:lahza/features/reviews/models/products_specs_model.dart';
import 'package:lahza/features/reviews/repositories/review_phone_repository.dart';



@Injectable()
class ProductsSpecsCubit extends Cubit<ProductsSpecsState> {
  final ReviewsRepository repository;

  ProductsSpecsCubit(this.repository) : super(ProductsSpecsInitial());

  void getProductSpecs(String id) async {
    emit(ProductsSpecsLoading());

    final response = await ErrorHandler.handleApiCall(() =>
        repository.getProductSpecs(id));
    switch (response) {
      case SuccessBaseResponse<ProductsSpecsModel>():
        final data = response.data;
        emit(ProductsSpecsSuccess(detailsModel:  data));

      case ErrorBaseResponse<ProductsSpecsModel>():
        emit(ProductsSpecsError(errorModel: response.errorModel));
    }
  }
}