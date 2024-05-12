import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:panshop_driver/core/utils/log.dart';
import 'package:panshop_driver/features/map/controllers/models/location_model.dart';

class MapService extends GetxService {
  final Location _location = Location();

  Future<LocationModel?> getCurrentLocation() async {
    bool locationServiceEnabled = await _location.serviceEnabled();
    if (!locationServiceEnabled) {
      locationServiceEnabled = await _location.requestService();
      if (!locationServiceEnabled) {
        logd('Error location service');
        return null;
      }
    }

    bool locationPermissionGranted =
        await _location.hasPermission() == PermissionStatus.granted;
    if (!locationPermissionGranted) {
      locationPermissionGranted =
          await _location.requestPermission() == PermissionStatus.granted;

      if (!locationPermissionGranted) {
        logd('Error location service');
        return null;
      }
    }

    LocationData locationData = await _location.getLocation();
    return LocationModel.fromLocationData(locationData);
  }
}
