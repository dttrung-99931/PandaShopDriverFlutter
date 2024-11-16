// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DeliveryProgressResponseDto {
  final int distanceInMetter;
  final int remainingDistance;
  final int durationInMinute;
  final double driverLat;
  final double driverLong;
  final double driverBearingInDegree;

  DeliveryProgressResponseDto({
    required this.distanceInMetter,
    required this.remainingDistance,
    required this.durationInMinute,
    required this.driverLat,
    required this.driverLong,
    required this.driverBearingInDegree,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'distanceInMetter': distanceInMetter,
      'remainingDistance': remainingDistance,
      'durationInMinute': durationInMinute,
      'driverLat': driverLat,
      'driverLong': driverLong,
      'driverBearingInDegree': driverBearingInDegree,
    };
  }

  factory DeliveryProgressResponseDto.fromMap(Map<String, dynamic> map) {
    return DeliveryProgressResponseDto(
      distanceInMetter: map['distanceInMetter'] as int,
      remainingDistance: map['remainingDistance'] as int,
      durationInMinute: map['durationInMinute'] as int,
      driverLat: map['driverLat'] as double,
      driverLong: map['driverLong'] as double,
      driverBearingInDegree: map['driverBearingInDegree'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryProgressResponseDto.fromJson(String source) =>
      DeliveryProgressResponseDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
