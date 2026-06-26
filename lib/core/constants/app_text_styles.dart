import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTextStyles {
  // Safe ScreenUtil helper to prevent fontSize <= 0 errors
  static double _sp(num size) {
    try {
      // If ScreenUtil is not initialized or returns invalid value, fallback to original size
      final sp = size.sp;
      return sp > 0 ? sp : size.toDouble();
    } catch (_) {
      return size.toDouble();
    }
  }

  // primary color styles
  static TextStyle get primaryDark24600 => GoogleFonts.inter(
    fontSize: _sp(24),
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
  static TextStyle get primaryDark24500 => GoogleFonts.inter(
    fontSize: _sp(24),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
    static TextStyle get primary24500 => GoogleFonts.inter(
    fontSize: _sp(24),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
      static TextStyle get primary11400 => GoogleFonts.inter(
    fontSize: _sp(11),
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static TextStyle get primaryDark18600 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
    static TextStyle get primaryDark14500 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
  static TextStyle get primaryDark14400 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );
  static TextStyle get primary14400 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
    static TextStyle get primary14500 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle get primary18500 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
    static TextStyle get primary18600 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
  static TextStyle get primaryDark18500 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
  static TextStyle get primaryDark15500 => GoogleFonts.inter(
    fontSize: _sp(15),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
  static TextStyle get primaryDark12500 => GoogleFonts.inter(
    fontSize: _sp(15),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );

  static TextStyle get primaryDark22600 => GoogleFonts.inter(
    fontSize: _sp(22),
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );
    static TextStyle get primaryDark22500 => GoogleFonts.inter(
    fontSize: _sp(22),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
    static TextStyle get primary22500 => GoogleFonts.inter(
    fontSize: _sp(22),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
    static TextStyle get primary16400 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
  static TextStyle get primaryDark16500 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w500,
    color: AppColors.primaryDark,
  );
  static TextStyle get primary16500 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static TextStyle get primary12400 => GoogleFonts.inter(
    fontSize: _sp(12),
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );
static TextStyle get primaryDark12400 => GoogleFonts.inter(
    fontSize: _sp(12),
    fontWeight: FontWeight.w400,
    color: AppColors.primaryDark,
  );

  // gray color styles
  static TextStyle get gray16500 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
  
  static TextStyle get gray12400 => GoogleFonts.inter(
    fontSize: _sp(12),
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle get gray9400 => GoogleFonts.inter(
    fontSize: _sp(9),
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle get gray12500 => GoogleFonts.inter(
    fontSize: _sp(12),
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle get gray16400 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
  static TextStyle get gray14400 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
  );
  static TextStyle get gray14500 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
    static TextStyle get gray9500 => GoogleFonts.inter(
    fontSize: _sp(10),
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
    // white color styles
  static TextStyle get white18600 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle get white18500 => GoogleFonts.inter(
    fontSize: _sp(18),
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
    static TextStyle get white16500 => GoogleFonts.inter(
    fontSize: _sp(16),
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle get white22500 => GoogleFonts.inter(
    fontSize: _sp(22),
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle get white22600 => GoogleFonts.inter(
    fontSize: _sp(22),
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );
  static TextStyle get white14500 => GoogleFonts.inter(
    fontSize: _sp(14),
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
    static TextStyle get white12400 => GoogleFonts.inter(
    fontSize: _sp(12),
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );
}