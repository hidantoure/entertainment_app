import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCcode;
  final String statusMessage;
  final bool success;
  const ErrorMessageModel({
    required this.statusCcode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusCcode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  List<Object> get props => [
        statusCcode,
        statusMessage,
        success,
      ];
}
