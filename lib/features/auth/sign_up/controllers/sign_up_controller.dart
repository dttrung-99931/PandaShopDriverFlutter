import 'package:get/get.dart';
import 'package:panshop_driver/core/base/base_form_controller.dart';
import 'package:panshop_driver/features/auth/sign_up/controllers/sign_up_form.dart';
import 'package:panshop_driver/features/auth/sign_up/screens/widgets/sign_up_successful_dialog.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';
import 'package:panshop_driver/features/auth/sign_up/services/sign_up_service.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';

class SignUpController extends BaseFormController<SignUpForm> {
  final isLoginSucces = RxBool(false);
  final SignUpService _service = Get.find();
  final Rx<bool?> isSuccessed = Rx(null);
  final Storage _storage = Get.find();

  Future<void> signUp(SignUpRequestDto request) async {
    await handleServiceResult(
      handleLoading: true,
      serviceResult: _service.signUp(request),
      dtoToModel: (dynamic dto) {
        return dto;
      },
      onSuccess: (dynamic _) {
        Get.dialog(SignUpSuccessfulDialog(request: request));
      },
    );
  }

  @override
  SignUpForm createForm() {
    return SignUpForm(moreValidator: null);
  }
}
