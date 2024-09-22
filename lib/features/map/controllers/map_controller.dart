import 'package:get/get.dart';
import 'package:here_panda_map/controller/here_panda_map_controller.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/core/utils/snack_utils.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  Future<void> init(CurrentDeliveryModel currentDelivery) async {
    isLoading = true;
    // Wait until map created
    await (PandaMap.controller as HerePandaMapController)
        .waitToLoadMapSenseComplete;
    await initDeliveryRoute(currentDelivery);
    isLoading = false;
  }

  Future<void> initDeliveryRoute(CurrentDeliveryModel currentDelivery) async {
    // TODO:
    AddressModel addr = currentDelivery.deliveryLocations.first;
    MapLocation dest = MapLocation(lat: addr.lat, long: addr.long);
    // MapLocation? current = PandaMap.controller.hcmCityCoordimate;
    // TODO: Get current location hanging out
    MapLocation? current = await PandaMap.mapService.getCurrentLocation();
    if (current == null) {
      showSnackbar('cannot_get_current_location'.tr);
      loge('Cannot get current location');
      return;
    }

    MapRoute? route;
    try {
      route = await PandaMap.routingController.findRoute(
        start: current,
        dest: dest,
      );
    } catch (e) {
      showSnackbar("Got an error when finding route");
      loge(e);
    }

    if (route != null) {
      await PandaMap.routingController.showRoute(route);
      await PandaMap.routingController.startNavigation(route);
    } else {
      loge('Cannot find route');
    }
  }

  @override
  void onClose() {
    // PandaMap.dispose();
    super.onClose();
  }
}
