import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/features/map/controllers/models/location_model.dart';
import 'package:panshop_driver/features/map/map_service.dart';

import '../../../core/base/base_controller.dart';

class MapController extends BaseController {
  final MapService _mapService = Get.find();
  final Set<Marker> markers = <Marker>{};
  final Set<Circle> circles = <Circle>{};
  Completer<GoogleMapController> _controllerCompleter = Completer();
  Future<GoogleMapController> get controllerFuture =>
      _controllerCompleter.future;
  int _currentMapTypeIndex = 1;
  int get currentMapTypeIndex => _currentMapTypeIndex;
  MapType get mapType => MapType.values[currentMapTypeIndex];

  void changeMapType() {
    _currentMapTypeIndex++;
    if (currentMapTypeIndex == MapType.values.length) {
      _currentMapTypeIndex = 0;
    }
    update();
  }

  void addMarker(LatLng latlng) {
    Marker marker =
        Marker(markerId: MarkerId(latlng.toString()), position: latlng);
    markers.add(marker);
    update();
  }

  void addRandomCircle(LatLng latlng) {
    Circle circle = Circle(
        circleId: CircleId(latlng.toString()),
        fillColor: Colors.purple[100 * (1 + Random().nextInt(8))]!,
        center: latlng,
        strokeWidth: 0,
        radius: 20.toDouble() * (1 + Random().nextInt(8)));

    circles.add(circle);
    update();
  }

  void onMapCreated(GoogleMapController controller) {
    // onMapCreated may be called many times by MapScreen due to back to home screen
    if (_controllerCompleter.isCompleted){
      _controllerCompleter = Completer();
    }
    _controllerCompleter.complete(controller);
    focusCurrentLocation(animate: false);
    update();
  }

  Future<void> focusCurrentLocation({bool animate = true}) async {
    LocationModel? location = await _mapService.getCurrentLocation();
    if (location != null) {
      focusMapTo(location);
    } else {
      logd('Google map: FInd location failed');
    }
  }

  Future<void> focusMapTo(LocationModel location, {bool animate = true}) async {
    return control((GoogleMapController controller) {
      CameraUpdate cameraUpdate = CameraUpdate.newLatLng(location.latLng);
      if (animate) {
        controller.animateCamera(cameraUpdate);
      } else {
        controller.moveCamera(cameraUpdate);
      }
    });
  }

  Future<void> control(Function(GoogleMapController controller) action) async {
    GoogleMapController controller = await controllerFuture;
    action(controller);
  }
}
