// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panshop_driver/features/auth/delivery/services/dtos/address_response.dart';

class AddressModel {
  AddressModel({
    required this.provinceOrCity,
    required this.provinceOrCityCode,
    required this.district,
    required this.districtCode,
    required this.communeOrWard,
    required this.streetAndHouseNum,
    required this.id,
  });
  final String provinceOrCity;
  final String provinceOrCityCode;
  final String district;
  final String districtCode;
  final String communeOrWard;
  final String streetAndHouseNum;
  final int id;

  String get adddress {
    return '$provinceOrCity, $district, $communeOrWard, $streetAndHouseNum'
        .trim();
  }

  factory AddressModel.fromDto(AddressResponseDto dto) {
    return AddressModel(
      provinceOrCity: dto.provinceOrCity,
      provinceOrCityCode: dto.provinceOrCityCode,
      district: dto.district,
      districtCode: dto.districtCode,
      communeOrWard: dto.communeOrWard,
      streetAndHouseNum: dto.streetAndHouseNum,
      id: dto.id,
    );
  }
}
