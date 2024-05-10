import 'package:panshop_driver/features/settings/controller.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';
import 'package:get/get.dart';
import 'main_controller.dart';
import 'core/utils/error_handler/error_report_service.dart';

class GlobalBinding extends Bindings {
  // Provide dependencies used before GetMaterialApp created
  @override
  Future<void> dependencies() async {
    Get.put(Storage());
    Get.put(ErrorReportService());
    Get.put(MainController());
    await Get.putAsync(SettingController.create);
  }
}
