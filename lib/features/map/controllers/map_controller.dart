import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  final pandaMapController = PandaMap.controller;

  void initDeliveryRoute(CurrentDeliveryModel currentDelivery) {
    // TODO:
    AddressModel addr = currentDelivery.deliveryLocations.first;
    MapLocation des = MapLocation(lat: addr.lat, long: addr.long);
    pandaMapController.focusLocation(des);
  }
}
