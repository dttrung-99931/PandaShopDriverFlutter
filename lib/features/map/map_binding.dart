import 'package:get/get.dart';
import 'package:panshop_driver/features/map/controllers/map_controller.dart';
import 'package:panshop_driver/features/map/map_service.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverMapService());
    Get.lazyPut(() => MapController(service: Get.find()));
  }
}
