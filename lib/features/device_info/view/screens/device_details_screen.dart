import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/device_info/cubit/device_info_cubit.dart';
import 'package:lahza/features/device_info/cubit/device_info_state.dart';
import 'package:lahza/features/device_info/models/request/repair_request.dart';
import 'package:lahza/features/device_info/view/widgets/add_image_card.dart';
import 'package:lahza/features/issue_types/models/responses/issue_type_model.dart';
import 'package:lahza/features/issue_types/view/widgets/custom_shadow_field.dart';

class DeviceDetailsScreen extends StatefulWidget {
  const DeviceDetailsScreen({super.key});

  @override
  State<DeviceDetailsScreen> createState() => _DeviceDetailsScreenState();
}

class _DeviceDetailsScreenState extends State<DeviceDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController phoneTypeController;
  late final TextEditingController phoneModelController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    phoneTypeController = TextEditingController();
    phoneModelController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    phoneTypeController.dispose();
    phoneModelController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final issue = args['issueType'] as IssueTypeModel;
    final String? otherIssue = args['otherIssue'];
    final String? otherIssueDescription = args['otherIssueDescription'];

    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.deviceDataTitle),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: BlocConsumer<DeviceInfoCubit, DeviceInfoState>(
          listener: (context, state) {
            switch (state) {
              case DeviceInfoFailure():
                CustomSnackBar.showError(state.message);

              case DeviceInfoSuccess():
                CustomSnackBar.showSuccess(state.response.message);

                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.reviewRequest,
                  arguments: state.response.data.id,
                );

              default:
                break;
            }
          },
          builder: (context, state) {
            final cubit = context.read<DeviceInfoCubit>();

            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        AppStrings.deviceDataSubtitle,
                        style: AppTextStyles.gray14400,
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Text(
                      AppStrings.phoneTypeLabel,
                      style: AppTextStyles.primaryDark18600,
                    ),

                    SizedBox(height: 8.h),

                    CustomShadowTextField(
                      controller: phoneTypeController,
                      hintText: AppStrings.phoneTypeHint,
                      height: 56.h,
                      validator: AppValidations.validatePhoneType,
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      AppStrings.phoneModelLabel,
                      style: AppTextStyles.primaryDark18600,
                    ),

                    SizedBox(height: 8.h),

                    CustomShadowTextField(
                      controller: phoneModelController,
                      hintText: AppStrings.phoneModelHint,
                      height: 56.h,
                      validator: AppValidations.validatePhoneModel,
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      AppStrings.issueDescriptionLabel,
                      style: AppTextStyles.primaryDark18600,
                    ),

                    SizedBox(height: 8.h),

                    CustomShadowTextField(
                      controller: descriptionController,
                      hintText: AppStrings.issueDescriptionHintOrder,
                      height: 150.h,
                      maxLines: 6,
                      validator: AppValidations.validateIssueDescription,
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      AppStrings.issueImageLabel,
                      style: AppTextStyles.primaryDark18600,
                    ),

                    SizedBox(height: 8.h),

                    const AddImageCard(),

                    SizedBox(height: 24.h),

                    ElevatedButton(
                      onPressed: state is DeviceInfoLoading
                          ? null
                          : () {
                              FocusScope.of(context).unfocus();

                              if (!_formKey.currentState!.validate()) {
                                return;
                              }

                              if (cubit.selectedImage == null) {
                                CustomSnackBar.showError(
                                  AppStrings.imageRequired,
                                );
                                return;
                              }

                              cubit.submitRepairRequest(
                                RepairRequest(
                                  issueType: issue.value!,
                                  description: descriptionController.text
                                      .trim(),
                                  phoneType: phoneTypeController.text.trim(),
                                  phoneModel: phoneModelController.text.trim(),
                                  otherIssue: otherIssue,
                                  otherIssueDescription: otherIssueDescription,
                                ),
                              );
                            },
                      child: state is DeviceInfoLoading
                          ? SizedBox(
                              width: 22.w,
                              height: 22.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text(AppStrings.inspectIssueButton),
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
