import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class SpecsDetailsWidget extends StatelessWidget {
  final String storage;
  final String battery;
  final String cpu;
  final String screen;

  const SpecsDetailsWidget({
    super.key,
    required this.storage,
    required this.battery,
    required this.cpu,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع متساوي
      children: [
        _buildItem(Icons.sd_storage_outlined, "التخزين", storage),
        _buildDivider(),
        _buildItem(Icons.battery_charging_full_outlined, "البطارية", battery),
        _buildDivider(),
        _buildItem(Icons.developer_board, "المعالج", cpu),
        _buildDivider(),
        _buildItem(Icons.smartphone, "الشاشة", screen),
      ],
    );
  }

  Widget _buildItem(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.primaryDark,
            size: 20.r,
          ),
          SizedBox(height: 5.h),
          Text(label, style: AppTextStyles.primary11400, maxLines: 1),
          Text(
            value,
            style: AppTextStyles.gray9500,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      height: 40.h,
      child: VerticalDivider(
        color: AppColors.grayLight,
        thickness: 1,
        width: 10,
      ),
    );
  }
}
