import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GetUpcomingDeliveriesRequestDto {
  GetUpcomingDeliveriesRequestDto();

  Map<String, dynamic> toMap() {
    return <String, dynamic>{};
  }

  factory GetUpcomingDeliveriesRequestDto.fromMap(Map<String, dynamic> map) {
    return GetUpcomingDeliveriesRequestDto();
  }

  String toJson() => json.encode(toMap());

  factory GetUpcomingDeliveriesRequestDto.fromJson(String source) =>
      GetUpcomingDeliveriesRequestDto.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
