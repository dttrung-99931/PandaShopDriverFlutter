import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/shared/widgets/common/text_input.dart';
import 'package:panshop_driver/shared/widgets/loading_widget.dart';

import '../../../core/base/base_get_widget.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends BaseGetWidget<LoginController> {
  LoginScreen({super.key});
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

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
                    'Login',
                    style: textTheme.titleSmall.withOpacity(0.5),
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
                            : Text('Login', style: textTheme.bodyMedium.withColor(AppColors.white)),
                      );
                    }),
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
