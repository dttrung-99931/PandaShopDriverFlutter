import 'package:get/get.dart';
import 'package:panshop_driver/features/home/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  HomeController());
  }
}