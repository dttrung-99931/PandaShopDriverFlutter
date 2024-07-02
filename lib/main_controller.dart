import 'package:get/get.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/core/utils/snack_utils.dart';
import 'package:panshop_driver/core/utils/utils.dart';
import 'package:panshop_driver/features/auth/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/features/main/main_screen.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';

import 'core/base/base_controller.dart';

class MainController extends BaseController {
  final Storage _storage = Get.find();

  void handleAuthNavigation() {
    if (isNullOrEmpty(_storage.token)) {
      Get.offNamed(LoginScreen.route);
    } else {
      logd('Bearer ${_storage.token}');
      Get.offNamed(MainScreen.route);
    }
  }

  void onTokenExpired() {
    if (_storage.token != null) {
      Get.find<LoginController>().logout();
      showSnackbar('login_secsion_expired'.tr);
    }
  }
}
