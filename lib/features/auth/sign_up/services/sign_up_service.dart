import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/api_service/api_service.dart';
import 'package:panshop_driver/core/base/base_model.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';

class SignUpService extends ApiService {
  Future<Either<AppError, dynamic>> signUp(SignUpRequestDto param) async {
    return handleResponse(
      responseFuture: post(
        '/v1/Users/Drivers',
        param.toJson(),
        decoder: (data) => ResponseWrapper.dataObject(
          responseJson: data,
          dataFromJson: (json) {
            return json;
          },
        ),
      ),
    );
  }
}
