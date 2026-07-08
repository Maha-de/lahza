import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/auth/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:lahza/features/auth/cubit/complete_profile/complete_profile_state.dart';
import 'package:lahza/features/auth/models/requests/complete_profile/complete_profile_request.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/city_model.dart';
import 'package:lahza/features/auth/models/responses/complete_profile/governorate_model.dart';
import 'package:lahza/features/auth/view/enums/auth_type.dart';
import 'package:lahza/features/auth/view/widgets/complete_profile_map.dart';
import 'package:lahza/features/auth/view/widgets/complete_profile_widget.dart';
import 'package:lahza/features/auth/view/widgets/custom_dropdown_faild.dart';
import 'package:lahza/features/auth/view/widgets/location_bottom_sheet.dart';

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
  final phoneController = TextEditingController();
  final phoneTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CompleteProfileCubit>().getCurrentLocation();
    });
  }

  @override
  void dispose() {
    addressController.dispose();
    phoneController.dispose();
    phoneTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteProfileCubit, CompleteProfileState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!.errorMessage),
            ),
          );
        }

        if (state.response != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("تم استكمال البيانات بنجاح"),
            ),
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.mainLayout,
            (_) => false,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<CompleteProfileCubit>();

        if (state.governorates.isEmpty) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBarWidget(title: AppStrings.completeProfile),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CompleteProfileWidget(),

                  SizedBox(height: 24.h),

                  CustomDropdownField(
                    title: AppStrings.governorate,
                    hint: AppStrings.chooseGovernorate,
                    value: state.selectedGovernorate?.governorateNameAr,
                    trailingWidget: SvgPicture.asset(AppAssets.governorateIcon),
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => LocationBottomSheet<GovernorateModel>(
                          title: AppStrings.chooseGovernorate,
                          items: state.governorates,
                          itemText: (e) => e.governorateNameAr,
                          onSelected: cubit.selectGovernorate,
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 16.h),

                  CustomDropdownField(
                    title: AppStrings.city,
                    hint: AppStrings.chooseCity,
                    value: state.selectedCity?.cityNameAr,
                    icon: Icons.location_on_outlined,
                    enabled: state.selectedGovernorate != null,
                    onTap: () {
                      if (state.selectedGovernorate == null) {
                        return;
                      }

                      FocusScope.of(context).unfocus();

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) => LocationBottomSheet<CityModel>(
                          title: AppStrings.chooseCity,
                          items: state.cities,
                          itemText: (e) => e.cityNameAr,
                          onSelected: cubit.selectCity,
                        ),
                      );
                    },
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
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.enterAddressDetails;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: AppStrings.enterAddressDetails,
                      contentPadding: EdgeInsets.symmetric(vertical: 20.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 12.h,
                        ),
                        child: Icon(
                          Icons.home_outlined,
                          color: AppColors.primary,
                        ),
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
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      validator: AppValidations.validatePhoneNumber,
                      decoration: const InputDecoration(
                        hintText: AppStrings.phoneNumberHint,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Text(
                      AppStrings.phoneType,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8.h),

                    TextFormField(
                      controller: phoneTypeController,
                      textInputAction: TextInputAction.done,
                      validator: AppValidations.validatePhoneType,
                      decoration: const InputDecoration(
                        hintText: AppStrings.phoneTypeHint,
                      ),
                    ),

                    SizedBox(height: 16.h),
                  ],

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: cubit.getCurrentLocation,
                      icon: const Icon(Icons.my_location),
                      label: const Text("استخدام موقعي الحالي"),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  CompleteProfileMap(
                    location: state.selectedLocation,
                    onMapCreated: (controller) {
                      cubit.mapController = controller;
                    },
                    onTap: cubit.changeLocation,
                  ),

                  SizedBox(height: 24.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.isLoading
                          ? null
                          : () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              if (state.selectedGovernorate == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("اختر المحافظة"),
                                  ),
                                );
                                return;
                              }

                              if (state.selectedCity == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("اختر المدينة")),
                                );
                                return;
                              }

                              if (state.selectedLocation == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("اختر موقعك على الخريطة"),
                                  ),
                                );
                                return;
                              }

                              FocusScope.of(context).unfocus();

                              cubit.completeProfile(
                                CompleteProfileRequest(
                                  governorate: state.selectedGovernorate!.id
                                      .toString(),
                                  area: state.selectedCity!.id.toString(),
                                  address: addressController.text.trim(),
                                  latitude: state.selectedLocation!.latitude,
                                  longitude: state.selectedLocation!.longitude,
                                  phone: phoneController.text.trim(),
                                  phoneType: phoneTypeController.text.trim(),
                                ),
                              );
                            },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: state.isLoading
                            ? SizedBox(
                                key: const ValueKey("loading"),
                                width: 24.w,
                                height: 24.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                AppStrings.createAccount,
                                key: ValueKey("text"),
                              ),
                      ),
                    ),
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
