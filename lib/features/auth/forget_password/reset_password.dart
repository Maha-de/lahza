import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

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
      Navigator.pushReplacementNamed(context, AppRoutes.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
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
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  validator: (value) => AppValidations.validateConfirmPassword(
                    value,
                    _confirmPasswordController.text,
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

                ElevatedButton(
                  onPressed: resetPassword,
                  child: const Text(AppStrings.resetPassword),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
