import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/api_service/api_service.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/features/auth/login/services/dtos/login_request.dart';
import 'package:panshop_driver/features/auth/login/services/dtos/login_response.dart';

class LoginService extends ApiService {
  Future<Either<AppError, LoginResponseDto>> login(
      LoginRequestDto param) async {
    return handleResponse(
      responseFuture: post(
        '/v1/Users/login',
        param.toJson(),
        decoder: (data) => ResponseWrapper.dataObject(
          responseJson: data,
          dataFromJson: LoginResponseDto.fromMap,
        ),
      ),
    );
  }
}
