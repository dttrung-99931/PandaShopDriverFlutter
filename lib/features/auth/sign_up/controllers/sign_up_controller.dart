import 'package:panshop_driver/features/auth/login/controllers/models/login_model.dart';
import 'package:panshop_driver/features/auth/login/services/dtos/login_request.dart';
import 'package:panshop_driver/features/auth/login/services/login_service.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';

class SignUpController extends BaseController {
  final isLoginSucces = RxBool(false);
  final LoginService _service = Get.find();
  final Storage _storage = Get.find();

  Future<void> login(String phone, String password) async {
    await handleServiceResult(
      serviceResult: _service.login(
        LoginRequestDto(phone: phone, password: password),
      ),
      dtoToModel: LoginModel.fromDto,
      onSuccess: (LoginModel result) {
        _storage.token = result.token;
        showSnackbar('Login success');
      },
    );
  }
}