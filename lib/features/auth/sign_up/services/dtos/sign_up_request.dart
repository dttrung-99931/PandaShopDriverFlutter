import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpRequestDto {
  final String phone; 
  final String password; 
  // TODO: add more info fields
  SignUpRequestDto({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'password': password,
    };
  }

  factory SignUpRequestDto.fromMap(Map<String, dynamic> map) {
    return SignUpRequestDto(
      phone: map['phone'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequestDto.fromJson(String source) => SignUpRequestDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
