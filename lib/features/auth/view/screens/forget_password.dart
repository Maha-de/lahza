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

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          CustomSnackBar.showSuccess(state.message);
          Navigator.pushNamed(
            context,
            AppRoutes.otpPage,
            arguments: _emailController.text.trim(),
          );
        } else if (state is ForgotPasswordError) {
          CustomSnackBar.showError(state.errorModel.errorMessage);
        }
      },
      child: Scaffold(
        appBar: const AppBarWidget(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.resetPassword,
                    style: AppTextStyles.primaryDark24500,
                  ),
                  SizedBox(height: 32.h),
                  Text(AppStrings.email,
                      style: AppTextStyles.primaryDark16500),
                  SizedBox(height: 16.h),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidations.validateEmail,
                    decoration: const InputDecoration(
                      hintText: AppStrings.enterEmail,
                    ),
                  ),
                  SizedBox(height: 400.h),
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: state is ForgotPasswordLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<ForgotPasswordCubit>()
                                      .forgotPassword(
                                          _emailController.text.trim());
                                }
                              },
                        child: state is ForgotPasswordLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text(AppStrings.sendCode),
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
