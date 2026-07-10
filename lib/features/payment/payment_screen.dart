import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/payment/payment_item_method.dart';
import 'package:lahza/features/payment/upload_image_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;

  final operationController = TextEditingController();

  @override
  void dispose() {
    operationController.dispose();
    super.dispose();
  }

  final paymentMethods = [
    {
      'image': AppAssets.vodafoneCash,
      'title': AppStrings.vodafoneCash,
      'number': AppStrings.cashNumber,
    },
    {
      'image': AppAssets.orangeCash,
      'title': AppStrings.orangeCash,
      'number': AppStrings.cashNumber,
    },
    {
      'image': AppAssets.etisalatCash,
      'title': AppStrings.etisalatCash,
      'number': AppStrings.cashNumber,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(title: AppStrings.subscriptionFees),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Text(
              AppStrings.subscriptionFeesTitle,
              style: AppTextStyles.gray14400,
            ),
            SizedBox(height: 12.h),
            Container(
              height: 110.h,
              width: 220.w,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.white90.withValues(alpha: 0.12),
                    blurRadius: 5,
                    offset: Offset.zero,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.subscriptionFees,
                    style: AppTextStyles.primaryDark15500,
                  ),

                  Text(
                    AppStrings.subAmount,
                    style: AppTextStyles.primaryDark22600,
                  ),

                  Text(AppStrings.oneTimeOnly, style: AppTextStyles.gray16400),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Text(
              AppStrings.choosePaymentMethod,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 12.h),

            Column(
              children: List.generate(
                paymentMethods.length,
                    (index) => PaymentMethodItem(
                  image: paymentMethods[index]['image']!,
                  title: paymentMethods[index]['title']!,
                  number: paymentMethods[index]['number']!,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
              ),
            ),

            Text(
              AppStrings.sendTransferReceipt,
              style: AppTextStyles.primaryDark18600,
            ),

            SizedBox(height: 12.h),

            UploadImageWidget(
              onTap: () {
                /// Pick Image
              },
              title: AppStrings.sendImageReceipt,
            ),

            SizedBox(height: 16.h),

            Row(
              children: [
                Text(
                  AppStrings.enterTransactionNumber,
                  style: AppTextStyles.primaryDark18600,
                ),
                Text(AppStrings.optional, style: AppTextStyles.gray14400),
              ],
            ),

            SizedBox(height: 5.h),

            TextFormField(
              controller: operationController,
              decoration: const InputDecoration(
                hintText: AppStrings.writeTransactionNumber,
              ),
            ),

            SizedBox(height: 12.h),

            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, AppRoutes.mainLayout);
                // Navigator.pushNamedAndRemoveUntil(
                //   context,
                //   AppRoutes.mainLayout,
                //       (route) => false,
                // );
              },
              child: Text(AppStrings.payNow, style: AppTextStyles.white16500),
            ),

            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
