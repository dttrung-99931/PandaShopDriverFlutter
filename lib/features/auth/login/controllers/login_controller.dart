import 'package:get/get.dart';
import 'package:panshop_driver/core/error/app_error.dart';
import 'package:panshop_driver/core/utils/snack_utils.dart';
import 'package:panshop_driver/features/auth/login/controllers/models/login_model.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/features/auth/login/services/dtos/login_request.dart';
import 'package:panshop_driver/features/auth/login/services/login_service.dart';
import 'package:panshop_driver/features/main/main_screen.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';

import '../../../../core/base/base_controller.dart';

class LoginController extends BaseController {
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
        Get.offNamed(MainScreen.route);
      },
      onError: (AppError result) {
        if (result is ServerError && result.statusCode == 401) {
          showSnackbar('login_failed'.tr);
        }
      },
    );
  }

  Future<void> logout() async {
    await _storage.clear();
    Get.offAllNamed(LoginScreen.route);
  }
}
