import 'package:injectable/injectable.dart';
import 'package:lahza/features/orders/api_client/my_orders_client.dart';
import 'package:lahza/features/orders/models/my_orders_model.dart';

@LazySingleton()
class MyOrdersRepository {
  final MyOrdersClient client;

  MyOrdersRepository({required this.client});


  Future<List<MyOrdersModel>> getMyOrders() async {
    try {
      final response = await client.getMyOrders();

      return response.data ?? [];
    } catch (e) {

      rethrow;
    }
  }
}

  //
  // Future<List<MyOrdersModel>> getMyOrders() async {
  //   try {
  //     final response = await client.getMyOrders();
  //
  //     await CacheHelper.saveData(key: 'cached_my_orders', value: jsonEncode(response.data));
  //
  //     return response;
  //   } catch (e) {
  //     final cachedData = CacheHelper.getData(key: 'cached_my_orders');
  //     if (cachedData != null) {
  //       return MyOrdersModel.fromJson(jsonDecode(cachedData));
  //     } else {
  //       rethrow;
  //     }
  //   }
  // }

