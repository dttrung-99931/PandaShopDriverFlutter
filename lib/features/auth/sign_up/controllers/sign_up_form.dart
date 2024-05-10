// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:panshop_driver/core/base/base_form.dart';
import 'package:panshop_driver/core/utils/validate.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';

class SignUpForm extends BaseForm {
  SignUpForm({required super.moreValidator});

  final phoneController = TextInputField(
    validator: (text) {
      return Validate.validateRequired(text, fieldName: 'Số điện thoại');
    },
  );
  final passwordController = TextInputField(
    validator: (text) {
      return Validate.validateRequired(text, fieldName: 'Mật khẩu');
    },
  );
  final passwordConfirmController = TextEditingController();

  String? passwordConfirmValidtor(String? text) {
    return Validate.confirmPass(
        pass: passwordController.text, confirmPass: passwordConfirmController.text, fieldName: 'Xác nhận mật khẩu');
  }

  SignUpRequestDto toRequestModel() {
    return SignUpRequestDto(
      phone: phoneController.text,
      password: passwordController.text,
    );
  }
}
