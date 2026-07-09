import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/auth/cubit/signup/signup_cubit.dart';
import 'package:lahza/features/auth/cubit/signup/signup_state.dart';
import 'package:lahza/features/auth/view/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBarWidget(
        title: AppStrings.createNewAccount,
        style: AppTextStyles.white22600,
        backgroundColor: AppColors.primary,
        iconColor: AppColors.white,
      ),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterSuccess():
              CustomSnackBar.showSuccess('تم إنشاء الحساب بنجاح');

              Future.delayed(const Duration(milliseconds: 800), () {
                if (!context.mounted) return;

                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.completeProfile,
                );
              });
              break;

            case RegisterError():
              CustomSnackBar.showError(state.errorModel.errorMessage);
              break;

            default:
              break;
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              const SignupForm(),

              if (state is RegisterLoading)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        },
      ),
    );
  }
}
