import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/sign_up/controllers/sign_up_controller.dart';
import 'package:panshop_driver/features/auth/sign_up/services/sign_up_service.dart';

import 'screens/sign_up_screen.dart';

final signUpRoute = GetPage(
  name: SignUpScreen.route,
  page: () => SignUpScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut(() => SignUpService());
    Get.lazyPut(() => SignUpController());
  }),
);
