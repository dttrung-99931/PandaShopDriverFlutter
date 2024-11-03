import 'package:get/get.dart';
import 'package:here_panda_map/controller/here_panda_map_controller.dart';
import 'package:panda_map/core/models/map_current_location.dart';
import 'package:panda_map/core/models/map_location.dart';
import 'package:panda_map/core/models/map_route.dart';
import 'package:panda_map/panda_map.dart';
import 'package:panshop_driver/core/constants/constants.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/core/utils/snack_utils.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/current_delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_progress_request.dart';
import 'package:panshop_driver/features/map/map_service.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  MapController({
    required DriverMapService service,
  }) : _service = service;
  final DriverMapService _service;
  CurrentDeliveryModel? _currentDeliveryModel;

  Future<void> init(CurrentDeliveryModel currentDelivery) async {
    _currentDeliveryModel = currentDelivery;
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
    } else {
      loge('Cannot find route');
    }
  }

  DateTime? _updateDate;

  // Update delivery progress on driver moving
  Future<void> onMoving(MapCurrentLocation location, MapRoute currentRoute,
      int remainingLengthInMetter) async {
    // Return if less than 3 secs from the last update delivery
    if (_updateDate != null &&
        DateTime.now().difference(_updateDate!).inSeconds <
            Constants.delvieryTrackingSecInterval) {
      return;
    }

    // Update delivery progress
    await _updateRouteProgress(
      currentRoute: currentRoute,
      remainingLengthInMetter: remainingLengthInMetter,
      currentLocation: location,
    );
  }

  Future<void> _updateRouteProgress({
    required MapRoute currentRoute,
    required int remainingLengthInMetter,
    required MapCurrentLocation currentLocation,
  }) async {
    _updateDate = DateTime.now();
    // TODO: handle subsequental
    await handleServiceResult(
      serviceResult: _service.updateDeliveryProgress(
        deliveryId: _currentDeliveryModel!.id,
        requestModel: DeliveryProgressRequestDto(
          distanceInMetter: currentRoute.lengthInMeters,
          remainingDistance: remainingLengthInMetter,
          durationInMinute: currentRoute.durationInMinutes,
          driverLat: currentLocation.lat,
          driverLong: currentLocation.long,
          driverBearingInDegree: currentLocation.bearingDegrees,
        ),
      ),
      onSuccess: (result) {},
    );
  }

  @override
  void onClose() {
    // PandaMap.dispose();
    super.onClose();
  }
}
