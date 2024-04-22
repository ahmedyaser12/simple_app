import 'package:simply_app/services/api_services/end_points.dart';

class ErrorModel {
  final String? errorMessage;
  final String? message;

  ErrorModel({
    required this.message,
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData[ApiKey.errorMessage],
      message: jsonData[ApiKey.message],
    );
  }
}
