import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class CustomSnackBar {
  CustomSnackBar._();

  static void showSuccess(String message) {
    _show(
      title: 'Success',
      message: message,
      color: const Color(0xFF46C234),
      animation: AppAssets.successAnimation,
    );
  }

  static void showError(String message) {
    _show(
      title: 'Error',
      message: message,
      color: const Color(0xFFE53935),
      animation: AppAssets.errorAnimation,
    );
  }

  static void _show({
    required String title,
    required String message,
    required Color color,
    required String animation,
  }) {
    BotToast.cleanAll();

    BotToast.showCustomNotification(
      duration: const Duration(seconds: 3),
      animationDuration: const Duration(milliseconds: 300),
      enableSlideOff: true,
      onlyOne: true,
      toastBuilder: (cancel) {
        return SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 75, maxHeight: 100),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .08),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(14),
                        bottomLeft: Radius.circular(14),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Lottie.asset(animation, repeat: false, width: 46, height: 46),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: AppTextStyles.primary16500),
                          const SizedBox(height: 4),
                          Text(
                            message,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.gray14400,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(width: 1, height: 45, color: Colors.grey.shade300),

                  IconButton(
                    onPressed: cancel,
                    splashRadius: 18,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
