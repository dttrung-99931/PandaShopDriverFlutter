// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panshop_driver/features/auth/login/services/dtos/login_response.dart';

class LoginModel {
  final int userId;
  final String token;
  LoginModel({
    required this.userId,
    required this.token,
  });

  factory LoginModel.fromDto(LoginResponseDto dto) {
    return LoginModel(userId: dto.userID, token: dto.token);
  }
}
