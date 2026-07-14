import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                Text(AppStrings.phoneNumber, style: AppTextStyles.primaryDark16500),
                SizedBox(height: 16.h),

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
                SizedBox(height: 400.h),

                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.otpPage,
                        );
                      }
                    }, child: Text(AppStrings.sendCode)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
