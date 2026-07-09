import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/features/auth/cubit/login/login_cubit.dart';
import 'package:lahza/features/auth/models/requests/login/login_request.dart';
import 'package:lahza/features/auth/view/widgets/social_auth_section.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Column(
      children: [
        SizedBox(height: 35.h),

        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.r),
                topRight: Radius.circular(32.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.email,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _emailController,
                      validator: AppValidations.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: AppStrings.enterEmail,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      AppStrings.password,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _passwordController,
                      validator: AppValidations.validatePassword,
                      obscureText: obscureText,
                      textInputAction: TextInputAction.done,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: AppStrings.passwordHint,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (_) => _login(cubit),
                    ),

                    SizedBox(height: 10.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.resetPassword,
                          );
                        },
                        child: const Text(
                          AppStrings.forgotPassword,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _login(cubit),
                        child: const Text(
                          AppStrings.login,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.dontHaveAccount,
                              style: AppTextStyles.gray14400,
                            ),
                            TextSpan(
                              text: AppStrings.createAccount,
                              style: AppTextStyles.primary14400,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.register,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    const SocialAuthSection(),

                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _login(LoginCubit cubit) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    cubit.login(
      LoginRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );
  }
}