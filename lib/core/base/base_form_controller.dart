import 'package:dartz/dartz.dart';
import 'package:panshop_driver/core/base/base_controller.dart';
import 'package:panshop_driver/core/base/base_form.dart';
import 'package:panshop_driver/core/error/app_error.dart';

abstract class BaseFormController<TForm extends BaseForm> extends BaseController {
  late final TForm form;
  BaseFormController() {
    form = createForm();
  }

  TForm createForm();

  bool validate() {
    Either<AppError, bool> result = form.validate();
    onValidateResult(result);
    return result.isRight();
  }

  void onValidateResult(Either<AppError, bool> validateResult) {
    validateResult.fold(
      (AppError error) {
        showSnackbar(error.message);
      },
      (isValid) => {},
    );
  }
}
