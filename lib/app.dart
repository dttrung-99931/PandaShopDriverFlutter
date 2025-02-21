// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:panshop_driver/config/routes.dart';
import 'package:panshop_driver/core/base/base_get_widget.dart';
import 'package:panshop_driver/core/constants/themes.dart';
import 'package:panshop_driver/core/translation/app_translation.dart';
import 'package:panshop_driver/core/utils/error_handler/exception_handler.dart';
import 'package:panshop_driver/features/auth/login/screens/login_screen.dart';
import 'package:panshop_driver/features/settings/controller.dart';
import 'package:panshop_driver/global_binding.dart';

void startApp() {
  // Run app in a zooned guarded to catch global exceptions
  runZonedGuarded(() async {
    await setup();
    runApp(
      DevicePreview(
        enabled: false,
        builder: (BuildContext context) => App(initialRoute: inititalRoute),
      ),
    );
  }, (error, stacktrace) {
    ExceptionHandler.handleAsyncError(error, stacktrace);
  });
}

Future<void> setup() async {
  // Setup error handler
  FlutterError.onError = ExceptionHandler.handleSyncError;

  // Setup error ui builder that builds ui to notify errors to users
  ErrorWidget.builder = ExceptionHandler.errorWidgetBuilder;
  await GetStorage.init();
  await GlobalBinding().dependencies();
}

class App extends BaseGetWidget<SettingController> {
  final String initialRoute;
  const App({
    super.key,
    this.initialRoute = LoginScreen.route,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        builder: (ctx, child) {
          return GetMaterialApp(
            initialRoute: initialRoute,
            getPages: routes,
            defaultTransition: Transition.cupertino,
            transitionDuration: const Duration(milliseconds: 800),
            debugShowCheckedModeBanner: false,
            theme: buildTheme(context),
            // Config translation
            translations: AppTranslation(),
            locale: controller.currentLocale,
          );
        },
      ),
    );
  }
}
