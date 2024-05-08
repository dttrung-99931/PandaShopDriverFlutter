import 'package:panshop_driver/core/error/app_error.dart';

class NetworkError extends AppError {
  NetworkError() : super(message: 'Network error');
}
