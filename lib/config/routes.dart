import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/login/login_route.dart';
import 'package:panshop_driver/features/auth/sign_up/sign_up_route.dart';
import 'package:panshop_driver/features/common/routes/splash_route.dart';
import 'package:panshop_driver/features/common/screens/splash_screen.dart';
import 'package:panshop_driver/features/main/main_route.dart';

String get inititalRoute => SplashScreen.route;
List<GetPage> routes = [
  loginRoute,
  signUpRoute,
  splashRoute,
  mainRoute,
];
