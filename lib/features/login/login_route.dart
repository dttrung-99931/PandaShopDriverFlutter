import 'package:panshop_driver/features/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/login/services/login_service.dart';
import 'package:get/get.dart';
import '../../config/routes.dart';
import 'screens/login_screen.dart';

final loginRoute = GetPage(
  name: Routes.login,
  page: () => LoginScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut(() => LoginService());
    Get.lazyPut(() => LoginController());
  }),
);
