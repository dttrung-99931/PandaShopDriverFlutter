import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/api_service.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';

class SignUpService extends ApiService {
  Future<Either<AppError, dynamic>> signUp(SignUpRequestDto param) async {
    return handleResponse(
      responseFuture: post(
        '/v1/Users/login',
        param.toJson(),
        decoder: (data) => ResponseWrapper.fromMap(
          data,
          (json) {
            return json;
          },
        ),
      ),
    );
  }
}
