import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/features/buy_phone/cubit/buy_phone/buy_phone_state.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_model.dart';
import 'package:lahza/features/buy_phone/models/responses/buy_phone_response.dart';
import 'package:lahza/features/buy_phone/repositories/buy_phone_repository.dart';

@injectable
class BuyPhoneCubit extends Cubit<BuyPhoneState> {
  final BuyPhoneRepository repository;

  BuyPhoneCubit({required this.repository}) : super(BuyPhoneInitial());

  final List<BuyPhoneModel> _allProducts = [];
  List<BuyPhoneModel> filteredProducts = [];
  List<String> brands = ['All'];
  String selectedBrand = 'All';

  Future<void> getProducts() async {
    emit(BuyPhoneLoading());

    final response = await ErrorHandler.handleApiCall(
      () => repository.getProducts(),
    );

    if (response is ErrorBaseResponse<BuyPhoneResponse>) {
      emit(BuyPhoneError(errorModel: response.errorModel));
      return;
    }

    final success = response as SuccessBaseResponse<BuyPhoneResponse>;

    _allProducts
      ..clear()
      ..addAll(success.data.data ?? []);

    filteredProducts = List.from(_allProducts);
    _prepareBrands();

    emit(BuyPhoneSuccess(data: filteredProducts));
  }

  void updateFavorite(String id, bool isFavorite) {
    final index = _allProducts.indexWhere((e) => e.id == id);

    if (index == -1) return;

    _allProducts[index].isFavorite = isFavorite;
    _applyFilter();
  }

  void filterByBrand(String brand) {
    selectedBrand = brand;
    _applyFilter();
  }

  void _applyFilter() {
    if (selectedBrand == 'All') {
      filteredProducts = List.from(_allProducts);
    } else {
      filteredProducts = _allProducts.where((phone) {
        return (phone.brand ?? '').toLowerCase() == selectedBrand.toLowerCase();
      }).toList();
    }

    emit(BuyPhoneSuccess(data: filteredProducts));
  }

  void _prepareBrands() {
    brands = [
      'All',
      ..._allProducts
          .map((e) => e.brand ?? '')
          .where((e) => e.isNotEmpty)
          .toSet()
          .toList()
        ..sort(),
    ];
  }

  Future<void> refreshProducts() async {
    await getProducts();
  }

  List<BuyPhoneModel> get allProducts => List.unmodifiable(_allProducts);
}
