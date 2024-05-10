// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:panshop_driver/core/error/app_error.dart';

class BaseForm {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Either<AppError, bool> Function()? moreValidator;
  BaseForm({
    required this.moreValidator,
  });

  Either<AppError, bool> validate() {
    bool isFormValid = formKey.currentState?.validate() ?? true;
    if (!isFormValid) {
      return Left(FormValidateError(message: 'Vui lòng nhập đầy đủ thông tin!'));
    }
    if (moreValidator != null) {
      return moreValidator!.call();
    }
    return const Right(true);
  }
}

// Is text edt controller + validator
class TextInputField extends TextEditingController {
  final String? Function(String? text)? validator;
  TextInputField({
    this.validator,
  });
}
