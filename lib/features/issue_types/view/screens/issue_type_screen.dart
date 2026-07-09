import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/core/widgets/custom_error_state.dart';
import 'package:lahza/core/widgets/custom_snack_bar.dart';
import 'package:lahza/features/issue_types/cubit/issue_type_cubit.dart';
import 'package:lahza/features/issue_types/cubit/issue_type_state.dart';
import 'package:lahza/features/issue_types/view/utils/issue_icons.dart';
import 'package:lahza/features/issue_types/view/widgets/custom_shadow_field.dart';
import 'package:lahza/features/issue_types/view/widgets/issue_type_card.dart';
import 'package:lahza/features/issue_types/view/widgets/order_search.dart';

class IssueTypeScreen extends StatefulWidget {
  const IssueTypeScreen({super.key});

  @override
  State<IssueTypeScreen> createState() => _IssueTypeScreenState();
}

class _IssueTypeScreenState extends State<IssueTypeScreen> {
  late final TextEditingController otherIssueController;
  late final TextEditingController otherIssueDescriptionController;

  @override
  void initState() {
    super.initState();

    otherIssueController = TextEditingController();
    otherIssueDescriptionController = TextEditingController();

    context.read<IssueTypeCubit>().fetchIssueTypes();
  }

  @override
  void dispose() {
    otherIssueController.dispose();
    otherIssueDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.orderTitle),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocConsumer<IssueTypeCubit, IssueTypeState>(
          listener: (context, state) {
            if (state is IssueTypeError) {
              CustomSnackBar.showError(state.errorModel.errorMessage);
            }
          },
          builder: (context, state) {
            final cubit = context.read<IssueTypeCubit>();

            switch (state) {
              case IssueTypeLoading():
                return const Center(child: CircularProgressIndicator());

              case IssueTypeError():
                return CustomErrorState(
                  message: state.errorModel.errorMessage,
                  onRetry: cubit.fetchIssueTypes,
                );

              case IssueTypeSuccess():
                final issues = state.data;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppStrings.orderDescription,
                          style: AppTextStyles.gray14400,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      OrderSearchField(onChanged: cubit.search),

                      SizedBox(height: 20.h),

                      Text(
                        AppStrings.orderTitle,
                        style: AppTextStyles.primaryDark16500,
                      ),

                      SizedBox(height: 16.h),

                      if (issues.isEmpty)
                        Center(
                          child: Text(
                            AppStrings.noIssuesHere,
                            style: AppTextStyles.primary16500,
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: issues.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12.w,
                                mainAxisSpacing: 12.h,
                                childAspectRatio: 1,
                              ),
                          itemBuilder: (_, index) {
                            final issue = issues[index];

                            return IssueTypeCard(
                              title: issue.label ?? '',
                              icon: IssueIcons.getIcon(issue.value ?? ''),
                              isSelected:
                                  cubit.selectedIssue?.value == issue.value,
                              onTap: () {
                                cubit.selectIssue(issue);
                              },
                            );
                          },
                        ),

                      SizedBox(height: 20.h),

                      if (cubit.selectedIssue?.value == 'OTHER') ...[
                        Text(
                          AppStrings.otherIssue,
                          style: AppTextStyles.primaryDark16500,
                        ),

                        SizedBox(height: 8.h),

                        CustomShadowTextField(
                          controller: otherIssueController,
                          hintText: AppStrings.otherIssueHint,
                          height: 56.h,
                        ),

                        SizedBox(height: 20.h),

                        Text(
                          AppStrings.issueDescription,
                          style: AppTextStyles.primaryDark16500,
                        ),

                        SizedBox(height: 8.h),

                        CustomShadowTextField(
                          controller: otherIssueDescriptionController,
                          hintText: AppStrings.issueDescriptionHint,
                          height: 140.h,
                          maxLines: 6,
                          maxLength: 500,
                        ),

                        SizedBox(height: 20.h),
                      ],

                      ElevatedButton(
                        onPressed: () {
                          if (cubit.selectedIssue == null) {
                            CustomSnackBar.showError(
                              AppStrings.chooseIssueType,
                            );
                            return;
                          }

                          Navigator.pushNamed(
                            context,
                            AppRoutes.orderDetails,
                            arguments: {
                              'issueType': cubit.selectedIssue,
                              'otherIssue': otherIssueController.text.trim(),
                              'otherIssueDescription':
                                  otherIssueDescriptionController.text.trim(),
                            },
                          );
                        },
                        child: const Text(AppStrings.continueText),
                      ),
                    ],
                  ),
                );

              case IssueTypeInitial():
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
