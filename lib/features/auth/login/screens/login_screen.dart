import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/config/app_config.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/utils/extension/ui_extensions.dart';
import 'package:panshop_driver/features/auth/sign_up/screens/sign_up_screen.dart';
import 'package:panshop_driver/shared/widgets/buttons/cutstom_button.dart';
import 'package:panshop_driver/shared/widgets/common/text_input.dart';

import '../../../../core/base/base_get_widget.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends BaseGetWidget<LoginController> {
  LoginScreen({super.key});
  static const route = '/login';
  final phoneController = TextEditingController(
    text: AppConfig.config.isDebug ? '0988202020' : null,
  );
  final passwordController = TextEditingController(
    text: AppConfig.config.isDebug ? 'aa123456' : null,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(r16),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                h8sb,
                Text(
                  'Panshop Driver',
                  style: textTheme.titleMedium,
                ),
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
                h16sb,
                TextInput(
                  controller: passwordController,
                  label: 'Mật khẩu',
                  textInputAction: TextInputAction.done,
                  style: textTheme.bodyMedium,
                  isPasswordInput: true,
                  onEditingComplete: _onLoginPressed,
                ),
                h32sb,
                SizedBox(
                  width: double.infinity,
                  height: h48,
                  child: Obx(() {
                    return CustomButton(
                      borderRadius: 8,
                      onPressed: _onLoginPressed,
                      isLoading: controller.isLoading,
                      label: 'Đăng nhập',
                      titleFontSize: textTheme.bodyMedium!.fontSize!,
                      // child: Text(,
                      //     style:
                      //         textTheme.bodyMedium.withColor(AppColors.white)),
                    );
                  }),
                ),
                h16sb,
                TextButton(
                  onPressed: () {
                    Get.offNamed(SignUpScreen.route);
                  },
                  child: Text(
                    'Đăng ký làm shipper',
                    style: textTheme.bodySmall,
                  ),
                ),
                // h96sb,
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onLoginPressed() {
    controller.login(
      phoneController.text,
      passwordController.text,
    );
  }
}
