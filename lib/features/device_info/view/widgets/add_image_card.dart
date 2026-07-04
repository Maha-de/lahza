
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/features/device_info/cubit/device_info_cubit.dart';

class AddImageCard extends StatelessWidget {
  const AddImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DeviceInfoCubit>();

    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Container(
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: cubit.selectedImage == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: const BoxDecoration(
                      color: AppColors.bannerBackground,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    AppStrings.addImage,
                    style: AppTextStyles.primaryDark15500,
                  ),
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.file(
                  cubit.selectedImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    final cubit = context.read<DeviceInfoCubit>();

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  await cubit.pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  await cubit.pickImageFromCamera();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}