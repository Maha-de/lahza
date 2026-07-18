import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/image_uploader/app_multi_part.dart';
import 'package:lahza/core/services/image_uploader/multi_part_services.dart';
import 'package:lahza/features/payment/api_client/subscription_api_client.dart';
import 'package:lahza/features/payment/models/requests/subscription_request.dart';
import 'package:lahza/features/payment/models/responses/subscription_response.dart';

@LazySingleton()
class SubscriptionRepository {
  final SubscriptionApiClient apiClient;
  final MultipartService multipartService;

  SubscriptionRepository({
    required this.apiClient,
    required this.multipartService,
  });

  Future<SubscriptionResponse> createSubscription({
    required SubscriptionRequest request,
    required AppMultipartFile receipt,
  }) async {
    final formData = await multipartService.createSubscriptionFormData(
      request: request,
      receipt: receipt,
    );

    return apiClient.createSubscription(formData);
  }

  Future<SubscriptionResponse> getMySubscription() {
    return apiClient.getMySubscription();
  }
}
