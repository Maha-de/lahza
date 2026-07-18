import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/features/device_info/models/request/repair_request.dart';
import 'package:lahza/features/payment/models/requests/subscription_request.dart';

@singleton
class MultipartService {
  Future<FormData> createRepairFormData({
    required RepairRequest request,
    required AppMultipartFile attachment,
  }) async {
    return FormData.fromMap({
      ...request.toJson(),
      'attachment': await attachment.toMultipartFile(),
    });
  }
  Future<FormData> createSubscriptionFormData({
    required SubscriptionRequest request,
    required AppMultipartFile receipt,
  }) async {
    return FormData.fromMap({
      "paymentMethod": request.paymentMethod,
      "transferNumber": request.transferNumber,
      "receipt": await receipt.toMultipartFile(),
    });
  }
}