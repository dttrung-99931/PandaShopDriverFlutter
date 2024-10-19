import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/delivery/screens/delivery_overveiw_bottom_sheet.dart';
import 'package:panshop_driver/features/map/map_binding.dart';

GetPage deliveryMapOverviewRoute = GetPage(
  transition: Transition.noTransition,
  fullscreenDialog: true,
  name: DeliveryOverviewBottomSheetScreen.router,
  page: () => DeliveryOverviewBottomSheetScreen(args: Get.arguments),
  binding: MapBinding(),
);
