import 'package:get/get.dart';
import 'package:panshop_driver/features/common/screens/splash_screen.dart';

final splashRoute = GetPage(
  name: SplashScreen.route,
  page: () => const SplashScreen(),
  transition: Transition.fadeIn,
);
