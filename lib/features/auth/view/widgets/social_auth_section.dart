import 'package:flutter/material.dart';
import 'package:lahza/features/auth/view/widgets/social_auth_widget.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialAuthWidget(
      onFacebookTap: () {
        // Disabled
      },
      onGoogleTap: () {
        // Disabled
      },
      onTwitterTap: () {
        // Disabled
      },
    );
  }
}
