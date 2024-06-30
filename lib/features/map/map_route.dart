import 'package:get/get.dart';
import 'package:panshop_driver/features/map/map_binding.dart';
import 'package:panshop_driver/features/map/map_screen.dart';

GetPage mapRoute = GetPage(
  name: MapScreen.router,
  page: () => MapScreen(),
  binding: MapBinding(),
);
