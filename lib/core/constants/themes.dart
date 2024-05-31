// ignore_for_file: unnecessary_late

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panshop_driver/core/constants/app_colors.dart';
import 'package:panshop_driver/core/constants/diemsions/dimensions.dart';

ThemeData buildTheme(BuildContext appContext) {
  return ThemeData(
    primarySwatch: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: const IconThemeData(color: AppColors.primary),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColors.primary,
        ),
      ),
    ),
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    fontFamily: 'Urbanist',
    textTheme: Theme.of(appContext).textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: fz32,
            color: AppColors.blackLight,
          ),
          titleMedium: TextStyle(
            fontSize: fz24,
            color: AppColors.blackLight,
          ),
          titleSmall: TextStyle(
            fontSize: fz20,
            color: AppColors.blackLight,
          ),

          // Contennt
          bodyLarge: TextStyle(
            fontSize: fz18,
            color: AppColors.blackLight,
          ),
          bodyMedium: TextStyle(
            fontSize: fz16,
            color: AppColors.blackLight,
          ),
          bodySmall: TextStyle(
            fontSize: fz14,
            color: AppColors.blackLight,
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
