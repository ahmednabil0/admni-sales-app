import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../consts/colors.dart';

ThemeData getThemeDate() {
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: Get.width * 0.035,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: Get.width * 0.04,
        vertical: Get.width * 0.015,
      ),
      fillColor: AppColors.backgroundColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.fontColor.withOpacity(0.35),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.width * 0.02),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: AppColors.seconrayColor.withOpacity(0.2),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.width * 0.02),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.width * 0.02),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.width * 0.02),
        ),
      ),
    ),
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Color(0x000000ff),
      secondary: Color(0x000000ff),
      onSecondary: Color(0x000000ff),
      error: Colors.red,
      onError: Colors.red,
      background: AppColors.backgroundColor,
      onBackground: AppColors.backgroundColor,
      surface: Color(0x000000ff),
      onSurface: Color(0x000000ff),
    ),
  );
}
