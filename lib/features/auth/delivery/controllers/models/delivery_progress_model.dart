// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panshop_driver/core/utils/format_utils.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_progress_response.dart';

class DeliveryProgressModel {
  DeliveryProgressModel({
    required this.distanceInMetter,
    required this.remainingDistance,
    required this.durationInMinute,
    required this.driverLat,
    required this.driverLong,
    required this.driverBearingInDegree,
  });

  factory DeliveryProgressModel.fromModel(DeliveryProgressResponseDto dto) {
    return DeliveryProgressModel(
      distanceInMetter: dto.distanceInMetter,
      remainingDistance: dto.remainingDistance,
      durationInMinute: dto.durationInMinute,
      driverLat: dto.driverLat,
      driverLong: dto.driverLong,
      driverBearingInDegree: dto.driverBearingInDegree,
    );
  }

  static DeliveryProgressModel zero = DeliveryProgressModel(
    distanceInMetter: 0,
    remainingDistance: 0,
    durationInMinute: 0,
    driverLat: 0,
    driverLong: 0,
    driverBearingInDegree: 0,
  );

  final int distanceInMetter;
  final double driverBearingInDegree;
  final double driverLat;
  final double driverLong;
  final int durationInMinute;
  final int remainingDistance;

  String get currentDistanceInfo =>
      formatMovingDistance(distanceInMetter, remainingDistance);

  double get routeCompletePercents {
    if (distanceInMetter == 0) {
      return 0;
    }
    return (distanceInMetter - remainingDistance) / distanceInMetter;
  }
}
