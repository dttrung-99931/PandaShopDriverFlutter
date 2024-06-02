// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_response.dart';

class DeliveryModel {
  DeliveryModel({
    required this.id,
    required this.address,
    required this.finishedAt,
    required this.startedAt,
  });
  factory DeliveryModel.fromDto(DeliveryResponseDto dto) {
    return DeliveryModel(
      id: dto.id,
      address: AddressModel.fromDto(dto.address),
      finishedAt: dto.finishedAt,
      startedAt: dto.startedAt,
    );
  }

  final int id;
  final AddressModel address;
  final DateTime? finishedAt;
  final DateTime? startedAt;
  // final DeliveryStatus startedAt;
  String get estimtatedPickUpDuration => "10mins";
}
