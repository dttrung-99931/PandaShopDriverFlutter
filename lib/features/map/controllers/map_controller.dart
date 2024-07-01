import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  final pandaMapController = PandaMap.controller;

  Future<void> initDeliveryRoute(CurrentDeliveryModel currentDelivery) async {
    // TODO:
    AddressModel addr = currentDelivery.deliveryLocations.first;
    MapLocation dest = MapLocation(lat: addr.lat, long: addr.long);
    MapLocation? current = PandaMap.controller.hcmCityCoordimate;
    // TODO: Get current location hanging out
    // MapLocation? current = await PandaMap.mapService.getCurrentLocation();
    if (current == null) {
      loge('Cannot get current location');
      return;
    }

    MapRoute? route = await PandaMap.routingController.findRoute(
      start: current,
      dest: dest,
    );

    if (route != null) {
      PandaMap.routingController.showRoute(route);
    } else {
      loge('Cannot find route');
    }
  }
}
