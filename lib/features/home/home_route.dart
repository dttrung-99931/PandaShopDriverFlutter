import 'package:panshop_driver/features/home/home_controller.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

final homeRoute = GetPage(
  name: HomeScreen.route,
  page: () => const HomeScreen(),
  binding: BindingsBuilder.put(() => HomeController()),
);
