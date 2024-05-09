// ignore_for_file: unnecessary_late

import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

ThemeData buildTheme(BuildContext appContext) {
  return ThemeData(
    primarySwatch: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(color: AppColors.primary),
    appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    fontFamily: 'Urbanist',
    textTheme: Theme.of(appContext).textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: fz32,
            color: AppColors.black,
          ),
          titleMedium: TextStyle(
            fontSize: fz24,
            color: AppColors.black,
          ),
          titleSmall: TextStyle(
            fontSize: fz20,
            color: AppColors.black,
          ),

          // Contennt
          bodyLarge: TextStyle(
            fontSize: fz18,
            color: AppColors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: fz16,
            color: AppColors.black,
          ),
          bodySmall: TextStyle(
            fontSize: fz14,
            color: AppColors.black,
          ),

          /// Lable
          labelMedium: TextStyle(
            fontSize: fz12,
          ),

          labelSmall: TextStyle(
            fontSize: fz10,
          ),
        ),
  );
}

late TextTheme _textTheme = Theme.of(Get.context!).textTheme;
TextTheme get textTheme => _textTheme;
