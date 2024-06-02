import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/shared/widgets/common/info_input.dart';
import 'package:panshop_driver/shared/widgets/common/loading_widget.dart';
import 'package:panshop_driver/shared/widgets/common/text_input.dart';

import '../../../../core/base/base_get_widget.dart';
import '../controllers/sign_up_controller.dart';

class SignUpScreen extends BaseGetWidget<SignUpController> {
  const SignUpScreen({super.key});

  static const route = '/signUp';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(r16),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.form.formKey,
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
                      style: textTheme.titleSmall.withOpacity(0.5),
                    ),
                    h48sb,
                    InfoInput.onlyInput(
                      controller: controller.form.phoneController,
                      label: 'Số điện thoại',
                      // labelStyle: textTheme.bodyMedium,
                      validator: controller.form.phoneController.validator,
                    ),
                    h8sb,
                    InfoInput.onlyInput(
                      controller: controller.form.passwordController,
                      label: 'Mật khẩu',
                      isPasswordInput: true,
                      validator: controller.form.passwordController.validator,
                    ),
                    h8sb,
                    InfoInput.onlyInput(
                      controller: controller.form.passwordConfirmController,
                      label: 'Mật khẩu xác nhận',
                      isPasswordInput: true,
                      validator: controller.form.passwordConfirmValidtor,
                    ),
                    h32sb,
                    _SignUpButton(controller: controller),
                    h4sb,
                    TextButton(
                      onPressed: () {
                        Get.offNamed(LoginScreen.route);
                      },
                      child: const Text('Đăng nhập'),
                    ),
                    h96sb,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({
    required this.controller,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: h48,
      child: Obx(() {
        return ElevatedButton(
          onPressed: controller.isLoading
              ? null
              : () {
                  if (controller.validate()) {
                    controller.signUp(controller.form.toRequestModel());
                  }
                },
          child: controller.isLoading
              ? const LoadingWidget()
              : Text('Đăng ký',
                  style: textTheme.bodyMedium.withColor(AppColors.white)),
        );
      }),
    );
  }
}
