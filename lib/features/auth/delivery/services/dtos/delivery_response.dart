import 'dart:convert';

import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_location_response.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryResponseDto {
  // final DeliveryStatus startedAt;
  DeliveryResponseDto({
    required this.id,
    required this.deliveryLocations,
    this.finishedAt,
    this.startedAt,
  });
  final int id;
  final List<DeliveryLocationDto> deliveryLocations;
  final DateTime? finishedAt;
  final DateTime? startedAt;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'deliveryLocations': deliveryLocations.map((x) => x.toMap()).toList(),
      'finishedAt': finishedAt?.millisecondsSinceEpoch,
      'startedAt': startedAt?.millisecondsSinceEpoch,
    };
  }

  factory DeliveryResponseDto.fromMap(Map<String, dynamic> map) {
    return DeliveryResponseDto(
      id: map['id'] as int,
      deliveryLocations: List<DeliveryLocationDto>.from(
        (map['deliveryLocations'] as List<dynamic>).map<DeliveryLocationDto>(
          (x) => DeliveryLocationDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      finishedAt:
          map['finishedAt'] != null ? DateTime.parse(map['finishedAt']) : null,
      startedAt:
          map['startedAt'] != null ? DateTime.parse(map['startedAt']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryResponseDto.fromJson(String source) =>
      DeliveryResponseDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
