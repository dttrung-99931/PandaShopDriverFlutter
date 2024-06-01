import 'dart:convert';

import 'package:panshop_driver/features/auth/delivery/services/dtos/address_response.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DeliveryResponseDto {
  final int id;
  final AddressResponseDto token;
  final DateTime? finishedAt;
  final DateTime? startedAt;
  // final DeliveryStatus startedAt;
  DeliveryResponseDto({
    required this.id,
    required this.token,
    this.finishedAt,
    this.startedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token.toMap(),
      'finishedAt': finishedAt?.millisecondsSinceEpoch,
      'startedAt': startedAt?.millisecondsSinceEpoch,
    };
  }

  factory DeliveryResponseDto.fromMap(Map<String, dynamic> map) {
    return DeliveryResponseDto(
      id: map['id'] as int,
      token: AddressResponseDto.fromMap(map['token'] as Map<String, dynamic>),
      finishedAt: map['finishedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['finishedAt'] as int)
          : null,
      startedAt: map['startedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DeliveryResponseDto.fromJson(String source) =>
      DeliveryResponseDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
