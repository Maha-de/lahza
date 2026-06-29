import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/custom_container.dart';
import 'package:lahza/features/buy_phone/phone_details/phone_specs_model.dart';

import 'spec_item.dart';

class PhoneSpecsWidget extends StatelessWidget {
  const PhoneSpecsWidget({super.key, required this.specs});

  final PhoneSpecsModel specs;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      padding: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.mainSpecifications,
            style: AppTextStyles.primaryDark15500,
          ),

          SizedBox(height: 10.h),

          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: _buildColumn(
                    top: SpecItem(
                      icon: Icons.camera_alt_outlined,
                      title: "الكاميرا الأمامية",
                      value: specs.frontCamera,
                    ),
                    bottom: SpecItem(
                      icon: Icons.sd_storage_outlined,
                      title: "التخزين الداخلي",
                      value: specs.storage,
                    ),
                  ),
                ),

                VerticalDivider(thickness: .5),

                Expanded(
                  child: _buildColumn(
                    top: SpecItem(
                      icon: Icons.camera_alt_outlined,
                      title: "الكاميرا الخلفية",
                      value: specs.rearCamera,
                    ),
                    bottom: SpecItem(
                      icon: Icons.memory_outlined,
                      title: "(RAM) الذاكرة",
                      value: specs.ram,
                    ),
                  ),
                ),

                VerticalDivider(thickness: .5),

                Expanded(
                  child: _buildColumn(
                    top: SpecItem(
                      icon: Icons.memory,
                      title: "المعالج",
                      value: specs.processor,
                    ),
                    bottom: SpecItem(
                      icon: Icons.battery_charging_full,
                      title: "البطارية",
                      value: specs.battery,
                    ),
                  ),
                ),

                VerticalDivider(thickness: .5),

                Expanded(
                  child: _buildColumn(
                    top: SpecItem(
                      icon: Icons.smartphone,
                      title: "الشاشة",
                      value: specs.screen,
                    ),
                    bottom: SpecItem(
                      icon: Icons.phone_iphone,
                      title: "نظام التشغيل",
                      value: specs.operatingSystem,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumn({required Widget top, required Widget bottom}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        top,
        SizedBox(height: 5.h),
        bottom,
      ],
    );
  }
}
