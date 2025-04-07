

import 'package:store/Core/Api/end_ponits.dart';

class ErrorModel {
  final int status;
  final String errMessage;

  const ErrorModel({required this.status, required this.errMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKey.status],
      errMessage: jsonData[ApiKey.errorMessage],
    );
  }
}
