// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lahza/core/constants/app_routes.dart';
// import 'package:lahza/core/constants/app_strings.dart';
// import 'package:lahza/core/constants/app_text_styles.dart';
// import 'package:lahza/core/widgets/app_bar_widget.dart';
// import 'package:lahza/core/widgets/custom_error_state.dart';
// import 'package:lahza/core/widgets/custom_snack_bar.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/utils/issue_icons.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_cubit.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_events.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/view_model/issue_type/issue_type_state.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/widgets/custom_shadow_field.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/widgets/issue_type_card.dart';
// import 'package:lahza/features/main_layout/home/repair/presentation/widgets/order_search.dart';
//
// class IssueTypeScreen extends StatefulWidget {
//   const IssueTypeScreen({super.key});
//
//   @override
//   State<IssueTypeScreen> createState() => _IssueTypeScreenState();
// }
//
// class _IssueTypeScreenState extends State<IssueTypeScreen> {
//   late final TextEditingController otherIssueController;
//   late final TextEditingController otherIssueDescriptionController;
//
//   @override
//   void initState() {
//     super.initState();
//     otherIssueController = TextEditingController();
//     otherIssueDescriptionController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     otherIssueController.dispose();
//     otherIssueDescriptionController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<IssueTypeCubit, IssueTypeStates>(
//       listenWhen: (previous, current) =>
//           previous.issueTypesState.errorMessage !=
//           current.issueTypesState.errorMessage,
//       listener: (context, state) {
//         if (state.issueTypesState.errorMessage != null) {
//           CustomSnackBar.showErrorMessage(state.issueTypesState.errorMessage!);
//         }
//       },
//       child: Scaffold(
//         appBar: const AppBarWidget(title: AppStrings.orderTitle),
//         body: BlocBuilder<IssueTypeCubit, IssueTypeStates>(
//           builder: (context, state) {
//             final cubit = context.read<IssueTypeCubit>();
//
//             if (state.issueTypesState.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             if (state.issueTypesState.errorMessage != null) {
//               return CustomErrorState(
//                 message: state.issueTypesState.errorMessage!,
//                 onRetry: () {
//                   cubit.doEvent(const GetIssueTypesEvent());
//                 },
//               );
//             }
//
//             final issues = state.filteredIssueTypes;
//
//             return SingleChildScrollView(
//               padding: EdgeInsets.all(16.r),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       AppStrings.orderDescription,
//                       style: AppTextStyles.gray14400,
//                     ),
//                   ),
//                   SizedBox(height: 16.h),
//
//                   OrderSearchField(
//                     onChanged: (value) {
//                       cubit.doEvent(SearchIssueTypesEvent(value));
//                     },
//                   ),
//
//                   SizedBox(height: 20.h),
//
//                   Text(
//                     AppStrings.orderTitle,
//                     style: AppTextStyles.primaryDark16500,
//                   ),
//
//                   SizedBox(height: 16.h),
//
//                   if (issues.isEmpty)
//                      Center(child: Text(AppStrings.noIssuesHere,style: AppTextStyles.primary16500,))
//                   else
//                     GridView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: issues.length,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 12.w,
//                         mainAxisSpacing: 12.h,
//                         childAspectRatio: 1,
//                       ),
//                       itemBuilder: (context, index) {
//                         final issue = issues[index];
//
//                         return IssueTypeCard(
//                           title: issue.label,
//                           icon: IssueIcons.getIcon(issue.value),
//                           isSelected:
//                               state.selectedIssueType?.value == issue.value,
//                           onTap: () {
//                             cubit.doEvent(SelectIssueTypeEvent(issue));
//                           },
//                         );
//                       },
//                     ),
//
//                   SizedBox(height: 20.h),
//
//                   if (state.selectedIssueType?.value == 'OTHER') ...[
//                     Text(
//                       AppStrings.otherIssue,
//                       style: AppTextStyles.primaryDark16500,
//                     ),
//                     SizedBox(height: 8.h),
//
//                     CustomShadowTextField(
//                       controller: otherIssueController,
//                       hintText: AppStrings.otherIssueHint,
//                       height: 56.h,
//                     ),
//
//                     SizedBox(height: 20.h),
//
//                     Text(
//                       AppStrings.issueDescription,
//                       style: AppTextStyles.primaryDark16500,
//                     ),
//                     SizedBox(height: 8.h),
//
//                     CustomShadowTextField(
//                       controller: otherIssueDescriptionController,
//                       hintText: AppStrings.issueDescriptionHint,
//                       height: 140.h,
//                       maxLines: 6,
//                       maxLength: 500,
//                     ),
//
//                     SizedBox(height: 20.h),
//                   ],
//
//                   ElevatedButton(
//                     onPressed: () {
//                       if (state.selectedIssueType == null) {
//                         CustomSnackBar.showErrorMessage(
//                           AppStrings.chooseIssueType,
//                         );
//                         return;
//                       }
//
//                       if (state.selectedIssueType?.value == 'OTHER' &&
//                           otherIssueController.text.trim().isEmpty) {
//                         CustomSnackBar.showErrorMessage(AppStrings.pleaseWirteIssueType);
//                         return;
//                       }
//
//                       if (state.selectedIssueType?.value == 'OTHER' &&
//                           otherIssueDescriptionController.text.trim().isEmpty) {
//                         CustomSnackBar.showErrorMessage(AppStrings.pleaseWirteIssueDescription);
//                         return;
//                       }
//
//                       Navigator.pushNamed(
//                         context,
//                         AppRoutes.orderDetails,
//                         arguments: {
//                           'issueType': state.selectedIssueType,
//
//                           if (state.selectedIssueType?.value == 'OTHER')
//                             'otherIssue': otherIssueController.text.trim(),
//
//                           if (state.selectedIssueType?.value == 'OTHER')
//                             'otherIssueDescription':
//                                 otherIssueDescriptionController.text.trim(),
//                         },
//                       );
//                     },
//                     child: Text(AppStrings.continueText),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
