// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

//We extends from equatable to prevent the duplication of objects in memory.
class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool isSuccess;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.isSuccess,
  });
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      isSuccess: json["success"],
    );
  }
  @override
  List<Object> get props => [statusCode, statusMessage, isSuccess];
}
