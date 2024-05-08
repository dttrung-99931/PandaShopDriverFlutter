// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:panshop_driver/core/base/base_get_widget.dart';
import 'package:panshop_driver/config/routes.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/features/login/login_route.dart';
import 'package:panshop_driver/features/settings/controller.dart';
import 'package:panshop_driver/core/translation/app_translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/constants/constants.dart';
import 'features/home/home_route.dart';

class App extends BaseGetWidget<SettingController> {
  final String initialRoute;
  const App({super.key, 
    this.initialRoute = Routes.login,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        builder: (ctx, child) => GetMaterialApp(
          initialRoute: initialRoute,
          getPages: [
            homeRoute,
            loginRoute,
          ],
          defaultTransition: Transition.cupertino,
          transitionDuration: const Duration(milliseconds: 800),
          debugShowCheckedModeBanner: false,
          theme: buildTheme(context),
          // Config translation
          translations: AppTranslation(),
          locale: controller.currentLocale,        
        ),
      ),
    );
  }
}
