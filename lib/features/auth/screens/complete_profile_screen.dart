import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/auth/enums/auth_type.dart';
import 'package:lahza/features/auth/screens/widgets/complete_profile_widget.dart';
import 'package:lahza/features/auth/screens/widgets/custom_dropdown_faild.dart';

class CompleteProfileScreen extends StatefulWidget {
  final AuthType authType;

  const CompleteProfileScreen({super.key, required this.authType});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  bool get isSocialLogin => widget.authType != AuthType.normal;

  final addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phoneTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.completeProfile),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompleteProfileWidget(),

              SizedBox(height: 24.h),

              CustomDropdownField(
                title: AppStrings.governorate,
                hint: AppStrings.chooseGovernorate,
                trailingWidget: SvgPicture.asset(AppAssets.governorateIcon),
                onTap: () {},
              ),
              SizedBox(height: 16.h),

              CustomDropdownField(
                title: AppStrings.city,
                hint: AppStrings.chooseCity,
                icon: Icons.location_on_outlined,
                onTap: () {},
              ),

              SizedBox(height: 16.h),
              Text(
                AppStrings.addressDetails,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),

              TextFormField(
                controller: addressController,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: AppStrings.enterAddressDetails,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.h,
                    ),
                    child: Icon(Icons.home_outlined, color: AppColors.primary),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              if (isSocialLogin) ...[
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
              ],
              SizedBox(height: 14.h),

              /// الخريطة
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: AppColors.grayLight),
                ),
                child: const Center(child: Text('Map Here')),
              ),

              SizedBox(height: 24.h),

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
                      Navigator.pushNamed(context, AppRoutes.login);
                    }
                  },
                  child: const Text(AppStrings.createAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
