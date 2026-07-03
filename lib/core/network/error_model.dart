
import 'package:lahza/core/constants/app_end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[AppEndPoints.status],
      errorMessage: jsonData[AppEndPoints.errorMessage],
    );
  }
}
