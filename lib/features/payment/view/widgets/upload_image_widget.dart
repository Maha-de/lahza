import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_text_styles.dart';

class UploadImageWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final File? image;

  const UploadImageWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayLight, width: 2),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: image != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.file(
            image!,
            width: double.infinity,
            height: 140.h,
            fit: BoxFit.cover,
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.bannerBackground,
              child: Icon(
                Icons.camera_alt_outlined,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: AppTextStyles.gray14400,
            ),
          ],
        ),
      ),
    );
  }
}