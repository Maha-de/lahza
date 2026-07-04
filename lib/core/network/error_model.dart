
import 'package:lahza/core/constants/app_end_points.dart';

class ErrorModel {
  final bool status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    print("DEBUG JSON: $jsonData");
    return ErrorModel(
      // status: jsonData[AppEndPoints.status],
      status: jsonData[AppEndPoints.status] ?? false,
      errorMessage: jsonData[AppEndPoints.errorMessage] ?? "حدث خطأ غير معروف",
    );
  }
}
