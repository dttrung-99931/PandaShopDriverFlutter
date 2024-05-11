import 'package:get/get.dart';
import 'package:panshop_driver/features/home/home_binding.dart';
import 'package:panshop_driver/features/main/main_screen.dart';

final mainRoute = GetPage(
  name: MainScreen.route,
  page: () => const MainScreen(),
  bindings: [HomeBinding()],
);
