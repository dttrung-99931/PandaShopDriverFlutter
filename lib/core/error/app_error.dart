// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panshop_driver/core/utils/log.dart';

class AppError {
  final String message;
  AppError({
    required this.message,
  });

  void log({StackTrace? moreDetailedStackTrace}) {
    loge('  Error');
    loge('    $runtimeType $message');

    // Log calling method
    List<String> stackTraces = (moreDetailedStackTrace ?? StackTrace.current).toString().split('\n');
    loge('    ${stackTraces[0]}');
    loge('    ${stackTraces[1]}');
  }
}

class UnexpectedAppError extends AppError {
  final Object? exception;
  UnexpectedAppError({required super.message, required this.exception});
}

class ServerError extends AppError {
  final int statusCode;
  ServerError({
    required super.message,
    required this.statusCode,
  });
}

class FormValidateError extends AppError {
  FormValidateError({required super.message});
}
