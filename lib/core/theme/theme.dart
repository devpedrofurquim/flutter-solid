import 'package:flutter/material.dart';
import 'package:test/core/theme/app_pallete.dart';

class AppTheme {
static OutlineInputBorder _border({Color color = AppPallete.borderColor}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 3),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(backgroundColor: AppPallete.backgroundColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(color: AppPallete.gradient2),
      errorBorder: _border(color: AppPallete.errorColor),
      focusedErrorBorder: _border(color: AppPallete.errorColor),
      filled: true,
      fillColor: AppPallete.backgroundColor, // optional, define in palette
    )
  );
}
