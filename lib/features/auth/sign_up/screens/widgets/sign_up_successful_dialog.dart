// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/features/auth/login/controllers/login_controller.dart';
import 'package:panshop_driver/features/auth/sign_up/services/dtos/sign_up_request.dart';
import 'package:panshop_driver/shared/widgets/dialog/app_alert_dialog.dart';

class SignUpSuccessfulDialog extends StatelessWidget {
  const SignUpSuccessfulDialog({
    Key? key,
    required this.request,
  }) : super(key: key);
  final SignUpRequestDto request;
  @override
  Widget build(BuildContext context) {
    return AppAlertDialog(
      title: 'Đăng ký thành công. Bạn muốn đăng nhập ngay không?',
      onConfirm: (){
        Get.find<LoginController>().login(request.phone, request.password);
      },
    );
  }
}
