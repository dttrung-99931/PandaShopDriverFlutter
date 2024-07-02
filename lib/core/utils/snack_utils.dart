import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';

Future<void> showSnackbar(String message, {String title = 'Thông báo'}) async {
  await Get.snackbar(
    title,
    message,
    colorText: Colors.black,
    backgroundColor: AppColors.grey,
  ).future;
}

void commingSoon() {
  showSnackbar('Tính năng đang được phát triển');
}
