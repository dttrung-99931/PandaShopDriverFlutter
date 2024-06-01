import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/delivery_controller.dart';
import 'package:panshop_driver/features/auth/delivery/services/delivery_service.dart';

class DeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeliveryService());
    Get.lazyPut(() => DeliveryController());
  }
}
