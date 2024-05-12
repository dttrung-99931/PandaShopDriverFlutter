import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

class LocationModel {
  LocationModel({
    required this.latitude,
    required this.longitude,
  });
  final double latitude;
  final double longitude;
  
  LatLng get latLng => LatLng(latitude, longitude);

  static LocationModel fromLocationData(LocationData locationData) {
    return LocationModel(
        latitude: locationData.latitude!, longitude: locationData.longitude!);
  }
}
