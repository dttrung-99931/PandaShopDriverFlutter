import 'package:get/get.dart';
import 'package:panshop_driver/features/home/home_controller.dart';
import 'package:panshop_driver/features/map/map_binding.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  HomeController());
    MapBinding().dependencies();    
  }
}