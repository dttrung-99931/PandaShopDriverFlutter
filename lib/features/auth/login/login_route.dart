import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/auth/login/services/login_service.dart';

import 'screens/login_screen.dart';

final loginRoute = GetPage(
  name: LoginScreen.route,
  page: () => LoginScreen(),
  binding: LoginBinding(),
);

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }
}
