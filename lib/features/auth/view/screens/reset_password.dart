import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/auth/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:lahza/features/auth/cubit/forgot_password/forgot_password_state.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  final String otp;
  const ResetPassword({super.key, required this.email, required this.otp});

  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void resetPassword() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      context.read<ForgotPasswordCubit>().resetPassword(
            widget.email,
            widget.otp,
            _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          CustomSnackBar.showSuccess(state.message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.success,
            (route) => false,
          );
        } else if (state is ForgotPasswordError) {
          CustomSnackBar.showError(state.errorModel.errorMessage);
        }
      },
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    AppStrings.createNewPassword,
                    style: AppTextStyles.primaryDark24600,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppStrings.createNewPasswordDescription,
                    style: AppTextStyles.gray16400,
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    AppStrings.newPassword,
                    style: AppTextStyles.primaryDark16500,
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: obscurePassword,
                    validator: AppValidations.validatePassword,
                    decoration: InputDecoration(
                      hintText: AppStrings.newPasswordHint,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppStrings.confirmPasswordHint,
                    style: AppTextStyles.primaryDark16500,
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    controller: _confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: obscureConfirmPassword,
                    validator: (value) =>
                        AppValidations.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                    decoration: InputDecoration(
                      hintText: AppStrings.confirmPasswordHint,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureConfirmPassword = !obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          obscureConfirmPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 200.h),
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is ForgotPasswordLoading
                            ? null
                            : resetPassword,
                        child: state is ForgotPasswordLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(AppStrings.resetPassword),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
