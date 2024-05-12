import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showSnackbar(String message, {String title = 'Thông báo'}) async {
  await Get.snackbar(
    title,
    message,
    colorText: Colors.black,
  ).future;
}

void commingSoon() {
  showSnackbar('Tính năng đang được phát triển');
}
