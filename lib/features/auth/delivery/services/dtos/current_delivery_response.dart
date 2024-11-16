import 'dart:convert';

import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_location_response.dart';
import 'package:panshop_driver/features/auth/delivery/services/dtos/delivery_progress_response.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CurrentDeliveryResponseDto {
  CurrentDeliveryResponseDto({
    required this.id,
    required this.deliveryLocations,
    this.finishedAt,
    this.startedAt,
    required this.progress,
  });
  final int id;
  final List<DeliveryLocationDto> deliveryLocations;
  final DateTime? finishedAt;
  final DateTime? startedAt;
  final DeliveryProgressResponseDto progress;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'deliveryLocations': deliveryLocations.map((x) => x.toMap()).toList(),
      'finishedAt': finishedAt?.millisecondsSinceEpoch,
      'startedAt': startedAt?.millisecondsSinceEpoch,
      'progress': progress.toMap(),
    };
  }

  factory CurrentDeliveryResponseDto.fromMap(Map<String, dynamic> map) {
    return CurrentDeliveryResponseDto(
      id: map['id'] as int,
      deliveryLocations: List<DeliveryLocationDto>.from(
        map['deliveryLocations'].map<DeliveryLocationDto>(
          (x) => DeliveryLocationDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
      finishedAt: map['finishedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['finishedAt'] as int)
          : null,
      startedAt: map['startedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startedAt'] as int)
          : null,
      progress: DeliveryProgressResponseDto.fromMap(
          map['progress'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentDeliveryResponseDto.fromJson(String source) =>
      CurrentDeliveryResponseDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
