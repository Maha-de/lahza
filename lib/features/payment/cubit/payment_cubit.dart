import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/config/base_response/base_response.dart';
import 'package:lahza/core/helpers/image_picker_helper.dart';
import 'package:lahza/core/network/error_handler.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/features/payment/cubit/payment_state.dart';
import 'package:lahza/features/payment/models/requests/subscription_request.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';
import 'package:lahza/features/payment/repositories/subscription_repository.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final SubscriptionRepository _repository;

  PaymentCubit(this._repository) : super(const PaymentInitial());

  File? selectedImage;

  Future<void> pickImageFromGallery() async {
    try {
      final image = await ImagePickerHelper.pickFromGallery();

      if (image == null) return;

      selectedImage = image;
      emit(PaymentImagePicked(image));
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<void> pickImageFromCamera() async {
    try {
      final image = await ImagePickerHelper.pickFromCamera();

      if (image == null) return;

      selectedImage = image;
      emit(PaymentImagePicked(image));
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  Future<void> submitSubscriptionRequest(
      SubscriptionRequest request,
      ) async {
    if (selectedImage == null) {
      emit(const PaymentFailure('يرجى اختيار صورة الإيصال'));
      return;
    }

    emit(const PaymentLoading());

    final response = await ErrorHandler.handleApiCall(
          () => _repository.createSubscription(
        request: request,
        receipt: AppMultipartFile.fromPath(selectedImage!.path),
      ),
    );

    switch (response) {
      case SuccessBaseResponse<SubscriptionResponse>():
        emit(PaymentSuccess(response.data));

      case ErrorBaseResponse<SubscriptionResponse>():
        emit(PaymentFailure(response.errorModel.errorMessage));
    }
  }

  void removeImage() {
    selectedImage = null;
    emit(const PaymentInitial());
  }
}