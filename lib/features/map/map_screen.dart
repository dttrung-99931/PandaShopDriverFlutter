import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:panshop_driver/core/base/base_get_widget.dart';
import 'package:panshop_driver/features/map/controllers/map_controller.dart';
import 'package:panshop_driver/shared/widgets/common/card_icon.dart';
import 'package:panshop_driver/shared/widgets/common/opacity_button.dart';

class MapScreen extends BaseGetWidget<MapController> {
  static const _kVNPosition = CameraPosition(target: LatLng(10, 106), zoom: 16);

  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder(
            init: controller,
            builder: (context) {
              return GoogleMap(
                mapType: controller.mapType,
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: MapScreen._kVNPosition,
                markers: controller.markers,
                circles: controller.circles,
                onTap: (latlng) {
                  if (Random().nextInt(2) == 1) {
                    controller.addMarker(latlng);
                  } else {
                    controller.addRandomCircle(latlng);
                  }
                },
                compassEnabled: true,
              );
            }
          ),
          Positioned(
            right: 16.r,
            top: 16.r,
            child: buildMapActionIcon(
              icon: Icons.layers_outlined,
              onPressed: controller.changeMapType,
            ),
          ),
          Positioned(
            right: 16.r,
            bottom: 16.r,
            child: buildMapActionIcon(
              icon: Icons.location_searching_outlined,
              onPressed: controller.focusCurrentLocation,
            ),
          ),
        ],
      ),
    );
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
}
