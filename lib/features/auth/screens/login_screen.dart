import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/auth/screens/widgets/social_auth_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool obscureText = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      Navigator.pushNamed(context, AppRoutes.payment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBarWidget(
        backgroundColor: AppColors.primary,
        iconColor: AppColors.white,
        title: AppStrings.login,
        style: AppTextStyles.white22600,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 35.h),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),

                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 80.h),

                          Text(
                            AppStrings.phoneNumber,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            validator: AppValidations.validatePhoneNumber,
                            decoration: const InputDecoration(
                              hintText: AppStrings.phoneNumberHint,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          Text(
                            AppStrings.password,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            controller: _passwordController,
                            obscureText: obscureText,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
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

                          SizedBox(height: 8.h),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.resetPassword,
                                );
                              },
                              child: Text(AppStrings.forgotPassword),
                            ),
                          ),

                          SizedBox(height: 24.h),

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                            ),
                            onPressed: login,
                            child: const Text(AppStrings.login),
                          ),

                          SizedBox(height: 16.h),

                          Center(
                            child: RichText(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: AppStrings.dontHaveAccount,
                                    style: AppTextStyles.gray14400,
                                  ),

                                  TextSpan(
                                    text: ' ${AppStrings.createAccount}',
                                    style: AppTextStyles.primary14400,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          SocialAuthWidget(
                            onFacebookTap: () {},
                            onGoogleTap: () {},
                            onTwitterTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
