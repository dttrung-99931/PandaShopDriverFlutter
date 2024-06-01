import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseGetWidget<TController extends BaseController>
    extends GetWidget<TController> {
  const BaseGetWidget({super.key});

  Future<void> showAlertDialog(String alertMsg, Function onYes) async {
    var alertDialog = AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("NO"),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            onYes();
          },
          child: const Text("YES"),
        ),
      ],
      title: Text(alertMsg),
    );
    await Get.dialog(alertDialog);
  }

  // Navigate to a route relatively
  void toNamedRelative(String routeName, {dynamic arguments}) {
    if (Get.currentRoute != '/') {
      Get.toNamed(Get.currentRoute + routeName, arguments: arguments);
    } else {
      Get.toNamed(routeName, arguments: arguments);
    }
  }
}
