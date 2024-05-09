import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/features/auth/sign_up/screens/sign_up_screen.dart';
import 'package:panshop_driver/shared/widgets/common/text_input.dart';
import 'package:panshop_driver/shared/widgets/loading_widget.dart';

import '../../../../core/base/base_get_widget.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends BaseGetWidget<LoginController> {
  LoginScreen({super.key});
  static const route = '/login';
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(s16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  h24sb,
                  Text(
                    'Panshop Driver',
                    style: textTheme.titleMedium,
                  ),
                  h16sb,
                  Text(
                    '- - - - - - -',
                    style: textTheme.titleSmall.withOpacity(0.3),
                  ),
                  h48sb,
                  TextInput(
                    controller: phoneController,
                    label: 'Số điện thoại',
                    textInputAction: TextInputAction.next,
                    style: textTheme.bodyMedium,
                  ),
                  h8sb,
                  TextInput(
                    controller: passwordController,
                    label: 'Mật khẩu',
                    textInputAction: TextInputAction.next,
                    style: textTheme.bodyMedium,
                    isPasswordInput: true,
                  ),
                  h32sb,
                  SizedBox(
                    width: double.infinity,
                    height: h48,
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () {
                                controller.login(
                                  phoneController.text,
                                  passwordController.text,
                                );
                              },
                        child: controller.isLoading
                            ? const LoadingWidget()
                            : Text('Đăng nhập', style: textTheme.bodyMedium.withColor(AppColors.white)),
                      );
                    }),
                  ),
                  h4sb,
                  TextButton(
                    onPressed: () {
                      Get.offNamed(SignUpScreen.route);
                    },
                    child: const Text('Đăng ký giao hàng'),
                  ),
                  h96sb,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
