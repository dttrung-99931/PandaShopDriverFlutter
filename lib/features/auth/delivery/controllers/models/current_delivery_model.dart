// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:panshop_driver/core/utils/extension/list_extension.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/address_model.dart';
import 'package:panshop_driver/features/auth/delivery/controllers/models/delivery_model.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/current_delivery_response.dart';

class CurrentDeliveryModel {
  CurrentDeliveryModel({
    required this.id,
    required this.deliveryLocations,
    required this.finishedAt,
    required this.startedAt,
  });
  factory CurrentDeliveryModel.fromDto(CurrentDeliveryResponseDto dto) {
    return CurrentDeliveryModel(
      id: dto.id,
      deliveryLocations: dto.deliveryLocations
          .mapList((location) => AddressModel.fromDto(location.address)),
      finishedAt: dto.finishedAt,
      startedAt: dto.startedAt,
    );
  }

  factory CurrentDeliveryModel.fromDelivery(DeliveryModel model) {
    return CurrentDeliveryModel(
      id: model.id,
      deliveryLocations: model.deliveryLocations,
      finishedAt: model.finishedAt,
      startedAt: model.startedAt,
    );
  }

  final int id;
  final List<AddressModel> deliveryLocations;
  final DateTime? finishedAt;
  final DateTime? startedAt;
  // final DeliveryStatus startedAt;
  String get estimtatedPickUpDuration => "10mins";
}
