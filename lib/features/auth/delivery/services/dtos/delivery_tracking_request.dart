// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:panda_map/core/models/map_current_location.dart';

class DeliveryTrackingRequestDto {
  final double lat;
  final double long;
  final double bearingInDegree;

  DeliveryTrackingRequestDto({
    required this.lat,
    required this.long,
    required this.bearingInDegree,
  });

  factory DeliveryTrackingRequestDto.fromCurrentLocation(
      MapCurrentLocation location) {
    return DeliveryTrackingRequestDto(
      lat: location.lat,
      long: location.long,
      bearingInDegree: location.bearingDegrees,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'long': long,
      'bearingInDegree': bearingInDegree,
    };
  }

  factory DeliveryTrackingRequestDto.fromMap(Map<String, dynamic> map) {
    return DeliveryTrackingRequestDto(
      lat: map['lat'] as double,
      long: map['long'] as double,
      bearingInDegree: map['bearingInDegree'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryTrackingRequestDto.fromJson(String source) =>
      DeliveryTrackingRequestDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
