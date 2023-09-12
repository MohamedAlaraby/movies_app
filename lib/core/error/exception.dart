import 'package:movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}

class LocalDBException implements Exception {
  final String errorMessage;
  const LocalDBException({required this.errorMessage});
}
