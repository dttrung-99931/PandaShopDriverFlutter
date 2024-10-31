import 'dart:collection';

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
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_tracking_request.dart';
import 'package:panshop_driver/features/map/map_service.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  MapController({
    required DriverMapService service,
  }) : _service = service;
  final DriverMapService _service;
  CurrentDeliveryModel? _currentDeliveryModel;
  final Queue<MapCurrentLocation> _locationTrackQueue = Queue();

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

  DateTime? _updateTrackingDate;
  bool _isCreatingTracking = false;

  Future<void> onMoving(MapCurrentLocation location) async {
    // Return if less than 3 secs from the last update delivery
    if (_updateTrackingDate != null &&
        DateTime.now().difference(_updateTrackingDate!).inSeconds <
            Constants.delvieryTrackingSecInterval) {
      return;
    }

    // Add queue if tracking is creating
    if (_isCreatingTracking) {
      _locationTrackQueue.addFirst(location);
      logd("Add queue, size = ${_locationTrackQueue.length}");
      return;
    }

    // create tracking
    _isCreatingTracking = true;
    _updateTrackingDate = DateTime.now();
    // TODO: handle subsequental
    await handleServiceResult(
      serviceResult: _service.createDelvieryTracking(
        deliveryId: _currentDeliveryModel!.id,
        requestModel: DeliveryTrackingRequestDto.fromCurrentLocation(location),
      ),
      onSuccess: (result) {},
    );
    _isCreatingTracking = false;

    // hanlde creating next tracking from queue
    if (_locationTrackQueue.isNotEmpty) {
      MapCurrentLocation next = _locationTrackQueue.last;
      _locationTrackQueue.removeLast();
      logd("Remove queue, size = ${_locationTrackQueue.length}");
      onMoving(next);
    }
  }

  @override
  void onClose() {
    // PandaMap.dispose();
    super.onClose();
  }
}
