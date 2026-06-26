import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/auth/enums/auth_type.dart';
import 'package:lahza/features/auth/screens/widgets/social_auth_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phoneTypeController = TextEditingController();

  bool obscureText = true;

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

      body: Column(
        children: [
          Container(height: 35.h, color: AppColors.primary),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColors.white,
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
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.name,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        controller: _nameController,
                        validator: AppValidations.validateUserName,
                        decoration: const InputDecoration(
                          hintText: AppStrings.fullNameHint,
                        ),
                      ),

                      SizedBox(height: 14.h),

                      /// Password
                      Text(
                        AppStrings.password,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8.h),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.visiblePassword,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        controller: _passwordController,
                        obscureText: obscureText,
                        validator: AppValidations.validatePassword,
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

                      /// Phone Number
                      Text(
                        AppStrings.phoneNumber,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8.h),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: AppValidations.validatePhoneNumber,
                        decoration: const InputDecoration(
                          hintText: AppStrings.phoneNumberHint,
                        ),
                      ),

                      SizedBox(height: 14.h),

                      /// Phone Type
                      Text(
                        AppStrings.phoneType,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8.h),

                      TextFormField(
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _phoneTypeController,
                        validator: AppValidations.validatePhoneType,

                        decoration: const InputDecoration(
                          hintText: AppStrings.phoneTypeHint,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.r),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.completeProfile,
                                arguments: AuthType.normal,
                              );
                            }
                          },
                          child: const Text(AppStrings.continueText),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      /// Login
                      Center(
                        child: RichText(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
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
                                    // Navigate To Login
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),

                      SocialAuthWidget(
                        onFacebookTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.completeProfile,
                            arguments: AuthType.facebook,
                          );
                        },
                        onGoogleTap: () {
                          // Google Sign In
                        },
                        onTwitterTap: () {
                          // Twitter Sign In
                        },
                      ),
                      SizedBox(height: 11.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}