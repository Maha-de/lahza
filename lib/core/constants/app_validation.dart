import 'package:lahza/core/constants/app_strings.dart';

abstract class AppValidations {
  AppValidations._();

  // ───────── Generic ─────────

  static String? required(
    String? value, [
    String field = 'هذا الحقل',
  ]) {
    if (value == null || value.trim().isEmpty) {
      return '$field مطلوب';
    }
    return null;
  }

  // ───────── Device Info ─────────

  static String? validatePhoneType(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.phoneTypeRequired;
    }

    if (value.trim().length < 2) {
      return AppStrings.phoneTypeRequiredTrue;
    }

    return null;
  }

  static String? validatePhoneModel(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.phoneModelRequired;
    }

    if (value.trim().length < 2) {
      return AppStrings.phoneModelRequiredTrue;
    }

    return null;
  }

  static String? validateIssueDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.issueDescriptionRequired;
    }

    if (value.trim().length < 10) {
      return AppStrings.issueDescriptionTooShort;
    }

    return null;
  }

  // ───────── Name ─────────

static String? validateUserName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppStrings.fullNameRequired;
  }

  if (value.trim().length < 3) {
    return AppStrings.usernameTooShort;
  }

  final regex = RegExp(r"^[\u0600-\u06FFa-zA-Z\s'-]+$");

  if (!regex.hasMatch(value.trim())) {
    return AppStrings.usernameInvalid;
  }

  return null;
}

  static String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.lastNameRequired;
    }

    if (value.trim().length < 3) {
      return AppStrings.nameTooShort;
    }

    if (RegExp(r'[0-9]').hasMatch(value)) {
      return AppStrings.nameNoNumbers;
    }

    return null;
  }

  static String? validateRecipientName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.recipientNameRequired;
    }

    if (value.trim().length < 3) {
      return AppStrings.nameTooShort;
    }

    if (RegExp(r'[0-9]').hasMatch(value)) {
      return AppStrings.nameNoNumbers;
    }

    return null;
  }

  // ───────── Email ─────────

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emailRequired;
    }

    final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value.trim())) {
      return AppStrings.invalidEmail;
    }

    return null;
  }

  // ───────── Password ─────────

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.passwordRequired;
    }

    if (value.length < 8) {
      return AppStrings.passwordTooShort;
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return AppStrings.passwordLowercase;
    }

    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return AppStrings.passwordUppercase;
    // }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppStrings.passwordNumber;
    }

    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return AppStrings.passwordSpecialCharacter;
    // }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? password,
  ) {
    if (value == null || value.isEmpty) {
      return AppStrings.confirmPasswordRequired;
    }

    if (value != password) {
      return AppStrings.passwordNotMatched;
    }

    return null;
  }

  // ───────── Phone ─────────

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.phoneRequired;
    }

    final regex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');

    if (!regex.hasMatch(value.trim())) {
      return AppStrings.phoneRequiredEgyptian;
    }

    return null;
  }
}