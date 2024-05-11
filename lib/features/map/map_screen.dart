import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/shared/widgets/common/card_icon.dart';
import 'package:panshop_driver/shared/widgets/common/opacity_button.dart';

import 'map_service.dart';

class MapScreen extends StatefulWidget {
  static const _kVNPosition = CameraPosition(target: LatLng(10, 106), zoom: 16);

  const MapScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildGoogleMap(),
          Positioned(
            right: 16.r,
            top: 16.r,
            child: buildMapTypeButton(),
          ),
          Positioned(
            right: 16.r,
            bottom: 16.r,
            child: buildMapActionIcon(
              icon: Icons.location_searching_outlined,
              onPressed: focusCurrentLocation,
            ),
          ),
        ],
      ),
    );
  }

  final _controller = Completer<GoogleMapController>();
  final Set<Marker> _markers = <Marker>{};
  final Set<Circle> _circles = <Circle>{};

  GoogleMap buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.values[currentMapTypeIndex],
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onMapCreated: (controller) {
        _controller.complete(controller);
        focusCurrentLocation(animate: false);
      },
      initialCameraPosition: MapScreen._kVNPosition,
      markers: _markers,
      circles: _circles,
      onTap: (latlng) {
        if (Random().nextInt(2) == 1) {
          addMarker(latlng);
        } else {
          addRandomCircle(latlng);
        }
      },
      compassEnabled: true,
    );
  }

  void addRandomCircle(LatLng latlng) {
    setState(() {
      var circle = Circle(
          circleId: CircleId(latlng.toString()),
          fillColor: Colors.purple[100 * (1 + Random().nextInt(8))]!,
          center: latlng,
          strokeWidth: 0,
          radius: 20.toDouble() * (1 + Random().nextInt(8)));

      _circles.add(circle);
    });
  }

  Widget buildMapTypeButton() {
    return buildMapActionIcon(
      icon: Icons.layers_outlined,
      onPressed: changeMapType,
    );
  }

  int currentMapTypeIndex = 1;
  void changeMapType() {
    setState(() {
      currentMapTypeIndex++;
      if (currentMapTypeIndex == MapType.values.length) {
        currentMapTypeIndex = 0;
      }
    });
  }

  void addMarker(LatLng latlng) {
    setState(() {
      var marker =
          Marker(markerId: MarkerId(latlng.toString()), position: latlng);
      _markers.add(marker);
    });
  }

  Widget buildMapActionIcon({
    required IconData icon,
    required Function() onPressed,
  }) {
    return OpacityButton(
      onTap: onPressed,
      child: CardIcon(
        icon,
        size: 24.r,
        padding: EdgeInsets.all(8.r),
      ),
    );
  }

  final MapService _mapService = Get.find();

  Future<void> focusCurrentLocation({bool animate = true}) async {
    var controller = await _controller.future;
    var location = await _mapService.getCurrentLocationn();
    if (location != null) {
      var cameraUpdate = CameraUpdate.newLatLng(
          LatLng(location.latitude!, location.longitude!));
      if (animate) {
        controller.animateCamera(cameraUpdate);
      } else {
        controller.moveCamera(cameraUpdate);
      }
    } else {
      print('FInd location failed');
    }
  }
}
