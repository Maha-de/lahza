import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/helpers/phone_extention.dart';
import 'package:lahza/features/auth/cubit/signup/signup_cubit.dart';
import 'package:lahza/features/auth/models/requests/register/register_request.dart';
import 'package:lahza/features/auth/view/widgets/social_auth_section.dart';
class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phoneTypeController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _phoneTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Column(
      children: [
        Container(
          height: 35.h,
        ),

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
                      AppStrings.fullName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _nameController,
                      validator: AppValidations.validateUserName,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: AppStrings.fullNameHint,
                      ),
                    ),

                    SizedBox(height: 14.h),

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
                      textInputAction: TextInputAction.next,
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
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      AppStrings.phoneNumber,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _phoneController,
                      validator:
                          AppValidations.validatePhoneNumber,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: AppStrings.phoneNumberHint,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    Text(
                      AppStrings.phoneType,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: _phoneTypeController,
                      validator: AppValidations.validatePhoneType,
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: AppStrings.phoneTypeHint,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          cubit.register(
                            RegisterRequest(
                              fullName:
                                  _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              password:
                                  _passwordController.text.trim(),
                              phone: _phoneController.text.toEgyptianPhone(),
                              phoneType:
                                  _phoneTypeController.text.trim(),
                            ),
                          );
                        },
                        child: const Text(
                          AppStrings.continueText,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: AppTextStyles.gray14400,
                            ),
                            TextSpan(
                              text: AppStrings.login,
                              style: AppTextStyles.primary14400,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.login,
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
}