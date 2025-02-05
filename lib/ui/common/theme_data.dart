import 'package:ceiba_app/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: kcPrimaryColor),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: kcPrimaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: kcPrimaryColor, style: BorderStyle.solid, width: 2),
        ),
      ),
    );
  }
}
