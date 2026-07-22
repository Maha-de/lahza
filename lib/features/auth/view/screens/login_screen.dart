import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/auth/cubit/login/login_cubit.dart';
import 'package:lahza/features/auth/cubit/login/login_state.dart';
import 'package:lahza/features/auth/view/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBarWidget(
        title: AppStrings.login,
        style: AppTextStyles.white22600,
        backgroundColor: AppColors.primary,
        iconColor: AppColors.white,
      ),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginSuccess():
              CustomSnackBar.showSuccess('تم تسجيل الدخول بنجاح');

              Future.delayed(const Duration(milliseconds: 800), () {
                if (!context.mounted) return;

                if (state.data.data.user.isProfileComplete) {
                  Navigator.pushReplacementNamed(context, AppRoutes.mainLayout);
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.completeProfile,
                  );
                }
              });
              break;

            case LoginError():
              CustomSnackBar.showError(state.errorModel.errorMessage);
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              const LoginForm(),
              if (state is LoginLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
