import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/main_layout/home/order_screen/custom_shadow_field.dart';
import 'package:lahza/features/main_layout/home/order_screen/issue_data.dart';
import 'package:lahza/features/main_layout/home/order_screen/issue_type_card.dart';
import 'package:lahza/features/main_layout/home/order_screen/order_search.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();

    super.dispose();
  }

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: AppStrings.orderTitle),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                AppStrings.orderDescription,
                style: AppTextStyles.gray14400,
              ),
            ),
            SizedBox(height: 16.h),

            const OrderSearchField(),
            SizedBox(height: 16.h),

            Text(AppStrings.orderTitle, style: AppTextStyles.primaryDark16500),
            SizedBox(height: 16.h),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: IssuesType.issues.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final issue = IssuesType.issues[index];

                return IssueTypeCard(
                  title: issue.title,
                  icon: issue.icon,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                );
              },
            ),
            SizedBox(height: 16.h),

            Text(AppStrings.otherIssue, style: AppTextStyles.primaryDark16500),
            SizedBox(height: 8.h),

            CustomShadowTextField(
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
              hintText: AppStrings.issueDescriptionHint,
              height: 140.h,
              maxLines: 6,
              maxLength: 500,
              controller: descriptionController,
            ),
            SizedBox(height: 32.h),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.orderDetails);
              },
              child: Text(AppStrings.continueText),
            ),
          ],
        ),
      ),
    );
  }
}
