import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

abstract class AppTheme {
  static ThemeData get mainTheme {
    return ThemeData(
      useMaterial3: true,

      // Colors
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.primary,

      // App Bar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppTextStyles.primaryDark22600,
      ),

      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.primary,
          elevation: 0,
          disabledForegroundColor: Colors.white,

          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          textStyle: AppTextStyles.white16500,
        ),
      ),

      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTextStyles.primary14500,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        hintStyle: const TextStyle(
          color: Colors.grey,
          decoration: TextDecoration.none,
        ),
        labelStyle: AppTextStyles.primary12400,

        errorStyle: TextStyle(color: AppColors.error, fontSize: 12),

        errorMaxLines: 4,

        border: _border(AppColors.grayLight),
        enabledBorder: _border(AppColors.grayLight),
        focusedBorder: _border(AppColors.primary, 1.5),
        errorBorder: _border(AppColors.error),
        focusedErrorBorder: _border(AppColors.error, 1.5),
      ),
      textTheme: TextTheme(titleMedium: AppTextStyles.primary18600),
      // Checkbox
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: AppColors.gray,
        thickness: 1,
        space: 1,
      ),

      // Progress Indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),
    );
  }
}

OutlineInputBorder _border(Color color, [double width = 1]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: color, width: width),
  );
}
