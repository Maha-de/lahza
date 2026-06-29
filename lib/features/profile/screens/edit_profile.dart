import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.editProfile,
        iconLeading: Icons.check,
        onLeadingPressed: (){
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Form(
            key: _formKey,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
        
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: AppColors.bannerBackground,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.primaryDark,
                    size: 30,
                  ),
                ),
                SizedBox(height: 14.h,),
        
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
        
                /// Confirm Password
                Text(
                  AppStrings.confirmPassword,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
        
                SizedBox(height: 8.h),
        
                TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  controller: _confirmPasswordController,
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
                SizedBox(height: 14.h,),
        
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
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
