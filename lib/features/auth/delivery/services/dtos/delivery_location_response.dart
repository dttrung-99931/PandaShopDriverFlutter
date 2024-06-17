import 'dart:convert';

import 'package:panshop_driver/features/auth/delivery/services/dtos/address_response.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/location_type.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryLocationDto {
  final AddressResponseDto address;
  final LocationType locationType;
  DeliveryLocationDto({
    required this.address,
    required this.locationType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address.toMap(),
      'locationType': locationType.toInt(),
    };
  }

  factory DeliveryLocationDto.fromMap(Map<String, dynamic> map) {
    return DeliveryLocationDto(
      address:
          AddressResponseDto.fromMap(map['address'] as Map<String, dynamic>),
      locationType: LocationType.fromInt(map['locationType'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryLocationDto.fromJson(String source) =>
      DeliveryLocationDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
