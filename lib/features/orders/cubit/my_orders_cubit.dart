import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/orders/cubit/my_orders_state.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';
import 'package:lahza/features/orders/repositories/my_orders_repository.dart';


@Injectable()
class MyOrdersCubit extends Cubit<MyOrdersState> {
  final MyOrdersRepository repository;

  MyOrdersCubit({required this.repository}) : super(MyOrdersInitial());

  void fetchMyOrders() async {
    emit(MyOrdersLoading());

    final response = await ErrorHandler.handleApiCall(() => repository.getMyOrders());

    switch (response) {
      case SuccessBaseResponse<List<MyOrdersModel>>():
        final data = response.data;

        emit(MyOrdersSuccess(myOrdersModel: data));

      case ErrorBaseResponse<List<MyOrdersModel>>():

        emit(MyOrdersError(errorModel: response.errorModel));
    }
  }

}



