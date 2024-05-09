import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/sign_up/screens/widgets/sign_up_successful_dialog.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';
import 'package:panshop_driver/features/auth/sign_up/services/sign_up_service.dart';
import 'package:panshop_driver/shared/services/storage_service.dart';

import '../../../../core/base/base_controller.dart';

class SignUpController extends BaseController {
  final isLoginSucces = RxBool(false);
  final SignUpService _service = Get.find();
  final Rx<bool?> isSuccessed = Rx(null);
  final Storage _storage = Get.find();

  Future<void> signUp(SignUpRequestDto request) async {
    await handleServiceResult(
      handleLoading: true,
      serviceResult: _service.signUp(
        request
      ),
      dtoToModel: (dynamic dto) {
        return dto;
      },
      onSuccess: (dynamic _) {
        Get.dialog(
           SignUpSuccessfulDialog(request: request)
        );
      },
    );
  }
}

