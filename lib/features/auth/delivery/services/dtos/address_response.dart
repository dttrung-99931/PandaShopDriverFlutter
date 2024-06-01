import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressResponseDto {
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final int id;
  AddressResponseDto({
    required this.provinceOrCity,
    required this.provinceOrCityCode,
    required this.district,
    required this.districtCode,
    required this.communeOrWard,
    required this.streetAndHouseNum,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provinceOrCity': provinceOrCity,
      'provinceOrCityCode': provinceOrCityCode,
      'district': district,
      'districtCode': districtCode,
      'communeOrWard': communeOrWard,
      'streetAndHouseNum': streetAndHouseNum,
      'id': id,
    };
  }

  factory AddressResponseDto.fromMap(Map<String, dynamic> map) {
    return AddressResponseDto(
      provinceOrCity: map['provinceOrCity'] as String,
      provinceOrCityCode: map['provinceOrCityCode'] as String,
      district: map['district'] as String,
      districtCode: map['districtCode'] as String,
      communeOrWard: map['communeOrWard'] as String,
      streetAndHouseNum: map['streetAndHouseNum'] as String,
      id: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressResponseDto.fromJson(String source) =>
      AddressResponseDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
