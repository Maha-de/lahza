import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/features/auth/cubit/login/login_cubit.dart';
import 'package:lahza/features/auth/screens/widgets/social_auth_widget.dart';


class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SocialAuthWidget(
      onFacebookTap: () {
          context.read<LoginCubit>().facebookLogin();
      },
      onGoogleTap: () {
        // context.read<LoginCubit>().googleLogin();
      },
      onTwitterTap: () {
        // TODO
      },
    );
  }
}