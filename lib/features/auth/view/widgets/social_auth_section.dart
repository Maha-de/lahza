import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/features/auth/view/enums/auth_type.dart';
import 'package:lahza/features/auth/view/widgets/social_auth_widget.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialAuthWidget(
      onFacebookTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.completeProfile,
          arguments: AuthType.facebook,
        );
      },
      onGoogleTap: () {
        // TODO
      },
      onTwitterTap: () {
        // TODO
      },
    );
  }
}